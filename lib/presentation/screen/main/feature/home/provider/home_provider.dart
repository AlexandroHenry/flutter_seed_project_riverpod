import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/presentation/screen/main/feature/home/provider/home_state.dart';
import 'package:uuid/uuid.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class Home extends _$Home {
  @override
  HomeState build() {
    return const HomeState();
  }

  Future<void> load({bool reload = false}) async {
    if (reload == true) {
      state = const HomeState();
    }
    state = state.copyWith(modal: const ModalEntity(showLoading: false));
  }

  void setModal(ModalEntity modal) {
    state = state.copyWith(modal: modal);
  }

  Future<Offset?> fetchLatestIdeaPosition() async {
    try {
      final qs = await FirebaseFirestore.instance
          .collection('ideas')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();
      if (qs.docs.isEmpty) return null;
      final data = qs.docs.first.data();
      final pos = (data['position'] as Map?) ?? {};
      final double x = (pos['x'] is num) ? (pos['x'] as num).toDouble() : 20000.0;
      final double y = (pos['y'] is num) ? (pos['y'] as num).toDouble() : 20000.0;
      return Offset(x, y);
    } catch (_) {
      return null;
    }
  }

  // 연결 요청 수락
  Future<void> acceptConnectionRequest({
    required String requestId,
    required String fromIdeaId,
    required String toIdeaId,
    required String fromUserId,
    required String toUserId,
  }) async {
    try {
      // 중복 연결 확인 (수락 시점에 다시 확인)
      final existingLinks = await FirebaseFirestore.instance
          .collection('idea_links')
          .where('ideaIds', arrayContainsAny: [fromIdeaId, toIdeaId])
          .get();

      final alreadyConnected = existingLinks.docs.any((linkDoc) {
        final linkData = linkDoc.data();
        final ideaIds = (linkData['ideaIds'] as List?)?.cast<String>() ?? [];
        return ideaIds.contains(fromIdeaId) && ideaIds.contains(toIdeaId);
      });

      if (alreadyConnected) {
        // 이미 연결된 경우 요청만 삭제
        await FirebaseFirestore.instance.collection('connection_requests').doc(requestId).update({
          'status': 'declined',
          'updatedAt': FieldValue.serverTimestamp(),
        });
        throw Exception('이미 연결된 카드예요');
      }

      // 중복이 없으면 연결 생성
      final linkId = const Uuid().v4();
      final fs = FirebaseFirestore.instance;

      await fs.collection('idea_links').doc(linkId).set({
        'linkId': linkId,
        'fromIdeaId': fromIdeaId,
        'toIdeaId': toIdeaId,
        'fromUserId': fromUserId,
        'toUserId': toUserId,
        'ideaIds': [fromIdeaId, toIdeaId],
        'participantUserIds': [fromUserId, toUserId],
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Ensure chat room exists for this link
      await fs.collection('chats').doc(linkId).set({
        'chatId': linkId,
        'linkId': linkId,
        'participantUserIds': [fromUserId, toUserId],
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      await fs.collection('connection_requests').doc(requestId).update({
        'status': 'accepted',
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 연결 요청 거절
  Future<void> declineConnectionRequest(String requestId) async {
    try {
      await FirebaseFirestore.instance.collection('connection_requests').doc(requestId).update({
        'status': 'declined',
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 연결 요청 생성
  Future<void> createConnectionRequest({
    required String sourceIdeaId,
    required String targetIdeaId,
    required String sourceUserId,
    required String targetUserId,
  }) async {
    try {
      // 중복 연결 확인 1: 이미 연결된 링크가 있는지 확인
      final existingLinks = await FirebaseFirestore.instance
          .collection('idea_links')
          .where('ideaIds', arrayContainsAny: [sourceIdeaId, targetIdeaId])
          .get();

      // 두 카드가 모두 포함된 링크가 있는지 확인
      final alreadyConnected = existingLinks.docs.any((doc) {
        final data = doc.data();
        final ideaIds = (data['ideaIds'] as List?)?.cast<String>() ?? [];
        return ideaIds.contains(sourceIdeaId) && ideaIds.contains(targetIdeaId);
      });

      if (alreadyConnected) {
        throw Exception('이미 연결된 카드예요');
      }

      // 중복 연결 확인 2: 보류 중인 연결 요청이 있는지 확인
      // 보안 규칙에 맞게, 현재 사용자(요청자)가 참여자인 문서만 조회하도록 필터링
      final pendingFromMe = await FirebaseFirestore.instance
          .collection('connection_requests')
          .where('status', isEqualTo: 'pending')
          .where('fromUserId', isEqualTo: sourceUserId)
          .get();

      final pendingToMe = await FirebaseFirestore.instance
          .collection('connection_requests')
          .where('status', isEqualTo: 'pending')
          .where('toUserId', isEqualTo: sourceUserId)
          .get();

      final allPendingDocs = <QueryDocumentSnapshot<Map<String, dynamic>>>[
        ...pendingFromMe.docs,
        ...pendingToMe.docs,
      ];

      final hasPendingRequest = allPendingDocs.any((doc) {
        final data = doc.data();
        final fromId = data['fromIdeaId'] as String?;
        final toId = data['toIdeaId'] as String?;
        // 양방향 모두 확인 (A→B 또는 B→A)
        return (fromId == sourceIdeaId && toId == targetIdeaId) ||
               (fromId == targetIdeaId && toId == sourceIdeaId);
      });

      if (hasPendingRequest) {
        throw Exception('이미 연결 요청이 보류 중이에요');
      }

      // 중복이 없으면 연결 요청 생성
      final String requestId = const Uuid().v4();
      await FirebaseFirestore.instance.collection('connection_requests').doc(requestId).set({
        'requestId': requestId,
        'fromIdeaId': sourceIdeaId,
        'toIdeaId': targetIdeaId,
        'fromUserId': sourceUserId,
        'toUserId': targetUserId,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 링크 삭제 (연결 해제)
  Future<void> deleteLink(String linkId, String linkDocId) async {
    try {
      final batch = FirebaseFirestore.instance.batch();

      // 1. 채팅 메시지 삭제
      try {
        final messagesSnapshot = await FirebaseFirestore.instance
            .collection('chats')
            .doc(linkId)
            .collection('messages')
            .get();

        for (final msgDoc in messagesSnapshot.docs) {
          batch.delete(msgDoc.reference);
        }
      } catch (e) {
        rethrow;
      }

      // 2. 채팅방 삭제
      try {
        batch.delete(FirebaseFirestore.instance.collection('chats').doc(linkId));
      } catch (e) {
        rethrow;
      }

      // 3. 링크 삭제
      try {
        batch.delete(FirebaseFirestore.instance.collection('idea_links').doc(linkDocId));
      } catch (e) {
        rethrow;
      }

      // 4. 모든 삭제 실행
      try {
        await batch.commit();
      } catch (e) {
        if (e is FirebaseException) {}
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  // 아이디어 생성
  Future<void> createIdea({
    required String title,
    required String content,
    required List<String> tags,
    required String category,
    String? mediaUrl,
    String? mediaType,
    Offset? canvasCenter,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('로그인이 필요합니다');
      }

      if (title.isEmpty) {
        throw Exception('제목을 입력해 주세요');
      }
      if (category.trim().isEmpty) {
        throw Exception('카테고리를 입력해 주세요');
      }
      if (content.trim().isEmpty) {
        throw Exception('내용을 입력해 주세요');
      }

      final firestore = FirebaseFirestore.instance;
      final ideaId = const Uuid().v4();

      final rnd = math.Random();
      final double baseX = (canvasCenter?.dx ?? 20000).toDouble();
      final double baseY = (canvasCenter?.dy ?? 20000).toDouble();
      final double jitterX = (rnd.nextDouble() * 1600) - 800; // -800 ~ +800
      final double jitterY = (rnd.nextDouble() * 1600) - 800;
      final defaultPos = {'x': baseX + jitterX, 'y': baseY + jitterY};

      await firestore.collection('ideas').doc(ideaId).set({
        'ideaId': ideaId,
        'ownerUserId': user.uid,
        'title': title,
        'content': content,
        'category': category.trim(),
        'categoryLower': category.trim().toLowerCase(),
        'tags': tags,
        'mediaUrl': mediaUrl,
        'mediaType': mediaType,
        'position': defaultPos,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 미디어 업로드
  Future<String?> uploadMedia({
    required String userId,
    required String ideaId,
    required String fileName,
    required List<int> bytes,
  }) async {
    try {
      final storage = FirebaseStorage.instance;
      final path = 'ideas/$userId/$ideaId/$fileName';
      final ref = storage.ref().child(path);
      final uploadTask = await ref.putData(bytes as Uint8List);
      final mediaUrl = await uploadTask.ref.getDownloadURL();
      return mediaUrl;
    } catch (e) {
      rethrow;
    }
  }

  // 아이디어 수정
  Future<void> updateIdea({
    required String docId,
    required String title,
    required String content,
    required List<String> tags,
  }) async {
    try {
      if (title.isEmpty) {
        throw Exception('제목을 입력해 주세요');
      }

      await FirebaseFirestore.instance.collection('ideas').doc(docId).update({
        'title': title,
        'content': content,
        'tags': tags,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 아이디어 위치 업데이트
  Future<void> updateIdeaPosition({
    required String docId,
    required Offset position,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('ideas').doc(docId).update({
        'position': {'x': position.dx, 'y': position.dy},
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // 아이디어 삭제
  Future<void> deleteIdea(String docId) async {
    try {
      final batch = FirebaseFirestore.instance.batch();

      // 1. 이 카드와 연결된 모든 링크 찾기
      final linksSnapshot = await FirebaseFirestore.instance
          .collection('idea_links')
          .where('ideaIds', arrayContains: docId)
          .get();

      // 2. 각 링크와 채팅방 삭제
      for (final linkDoc in linksSnapshot.docs) {
        final linkId = linkDoc.id;

        // 채팅 메시지 삭제
        final messagesSnapshot = await FirebaseFirestore.instance
            .collection('chats')
            .doc(linkId)
            .collection('messages')
            .get();
        for (final msgDoc in messagesSnapshot.docs) {
          batch.delete(msgDoc.reference);
        }

        // 채팅방 삭제
        batch.delete(FirebaseFirestore.instance.collection('chats').doc(linkId));

        // 링크 삭제
        batch.delete(linkDoc.reference);
      }

      // 3. 연결 요청 삭제 (fromIdeaId 또는 toIdeaId에 포함된 것)
      final requestsFrom = await FirebaseFirestore.instance
          .collection('connection_requests')
          .where('fromIdeaId', isEqualTo: docId)
          .get();
      for (final reqDoc in requestsFrom.docs) {
        batch.delete(reqDoc.reference);
      }

      final requestsTo = await FirebaseFirestore.instance
          .collection('connection_requests')
          .where('toIdeaId', isEqualTo: docId)
          .get();
      for (final reqDoc in requestsTo.docs) {
        batch.delete(reqDoc.reference);
      }

      // 4. 카드 자체 삭제
      batch.delete(FirebaseFirestore.instance.collection('ideas').doc(docId));

      // 5. 모든 삭제 실행
      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  // 카드 보관(30일 후 자동 삭제) + 관련 링크/채팅/요청 정리
  Future<void> archiveIdeaWithCleanup(String docId) async {
    try {
      // 연결 링크 조회
      final linksSnapshot = await FirebaseFirestore.instance
          .collection('idea_links')
          .where('ideaIds', arrayContains: docId)
          .get();

      for (final linkDoc in linksSnapshot.docs) {
        final linkId = linkDoc.id;
        final batch = FirebaseFirestore.instance.batch();
        try {
          final messagesSnapshot =
              await FirebaseFirestore.instance.collection('chats').doc(linkId).collection('messages').get();
          for (final msgDoc in messagesSnapshot.docs) {
            batch.delete(msgDoc.reference);
          }
        } catch (_) {
          // ignore
        }
        try {
          batch.delete(FirebaseFirestore.instance.collection('chats').doc(linkId));
        } catch (_) {
          // ignore
        }
        try {
          await batch.commit();
        } catch (_) {
          // ignore
        }
        // 링크 삭제는 별도로 수행
        try {
          await linkDoc.reference.delete();
        } catch (_) {
          // ignore
        }
      }

      // 연결 요청 정리 (양 방향)
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        try {
          final myRequests = await FirebaseFirestore.instance
              .collection('connection_requests')
              .where('fromUserId', isEqualTo: uid)
              .get();
          for (final doc in myRequests.docs) {
            final data = doc.data();
            if (data['fromIdeaId'] == docId || data['toIdeaId'] == docId) {
              await doc.reference.delete();
            }
          }
        } catch (_) {}
        try {
          final received = await FirebaseFirestore.instance
              .collection('connection_requests')
              .where('toUserId', isEqualTo: uid)
              .get();
          for (final doc in received.docs) {
            final data = doc.data();
            if (data['fromIdeaId'] == docId || data['toIdeaId'] == docId) {
              await doc.reference.delete();
            }
          }
        } catch (_) {}
      }

      // 보관 상태로 업데이트
      final now = DateTime.now();
      final deleteAt = now.add(const Duration(days: 30));
      await FirebaseFirestore.instance.collection('ideas').doc(docId).update({
        'deletedAt': FieldValue.serverTimestamp(),
        'scheduledDeleteAt': Timestamp.fromDate(deleteAt),
        'status': 'archived',
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }
}


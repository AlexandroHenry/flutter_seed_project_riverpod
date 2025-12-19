import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_crew/presentation/screen/auth/verify/provider/verify_email_state.dart';

part 'verify_email_provider.g.dart';

@riverpod
class VerifyEmail extends _$VerifyEmail {
  Timer? _autoCheckTimer;

  @override
  VerifyEmailState build() {
    ref.onDispose(() {
      _autoCheckTimer?.cancel();
    });

    // 5초마다 자동으로 인증 상태 체크
    _autoCheckTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      checkVerifiedSilently();
    });

    return const VerifyEmailState();
  }

  Future<void> checkVerifiedSilently() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      final refreshed = FirebaseAuth.instance.currentUser;
      final verified = refreshed?.emailVerified ?? false;

      if (verified) {
        _autoCheckTimer?.cancel();
        
        // Firebase ID 토큰 가져오기
        final idToken = await user?.getIdToken() ?? '';
        if (idToken.isNotEmpty) {
          state = state.copyWith(verified: true);
        }
      }
    } catch (_) {
      // 조용히 실패 처리 (UI 변경 없음)
    }
  }

  Future<void> resendEmail() async {
    state = state.copyWith(sending: true, errorMessage: '');

    try {
      await FirebaseAuth.instance.setLanguageCode('ko');
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        state = state.copyWith(
          sending: false,
          errorMessage: '로그인이 만료되었습니다. 다시 로그인해 주세요.',
        );
        return;
      }

      await user.sendEmailVerification();
      state = state.copyWith(
        sending: false,
        errorMessage: 'SUCCESS:인증 메일을 다시 전송했습니다.',
      );
    } on FirebaseAuthException catch (e) {
      String message = '메일 전송에 실패했습니다.';
      switch (e.code) {
        case 'too-many-requests':
          message = '너무 많은 요청이 발생했습니다. 잠시 후 다시 시도해 주세요.';
          break;
        case 'network-request-failed':
          message = '네트워크 오류가 발생했습니다. 연결을 확인해 주세요.';
          break;
        case 'user-disabled':
        case 'user-token-expired':
        case 'invalid-user-token':
          message = '세션이 만료되었습니다. 다시 로그인해 주세요.';
          break;
      }
      state = state.copyWith(sending: false, errorMessage: message);
    } catch (e) {
      state = state.copyWith(
        sending: false,
        errorMessage: '메일 전송 중 오류가 발생했습니다.',
      );
    }
  }

  Future<void> checkVerified() async {
    state = state.copyWith(checking: true, errorMessage: '');

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('User not found');
      }

      await user.reload();
      final refreshed = FirebaseAuth.instance.currentUser;
      final verified = refreshed?.emailVerified ?? false;

      if (verified) {
        _autoCheckTimer?.cancel();

        // Firebase ID 토큰 가져오기
        final idToken = await user.getIdToken() ?? '';
        if (idToken.isEmpty) {
          throw Exception('Failed to get ID token');
        }

        state = state.copyWith(checking: false, verified: true);
      } else {
        state = state.copyWith(
          checking: false,
          errorMessage: 'WARNING:아직 인증이 완료되지 않았습니다. 메일을 확인해 주세요.',
        );
      }
    } catch (e) {
      state = state.copyWith(
        checking: false,
        errorMessage: '인증 상태를 확인하지 못했습니다.',
      );
    }
  }

  Future<void> signOut() async {
    _autoCheckTimer?.cancel();
    await FirebaseAuth.instance.signOut();
  }

  void clearError() {
    state = state.copyWith(errorMessage: '');
  }
}

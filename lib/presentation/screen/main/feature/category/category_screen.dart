import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_crew/presentation/screen/main/feature/home/home_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카테고리'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                hintText: '카테고리 검색',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('ideas').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('오류: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs.where((doc) {
                  final data = doc.data();
                  final status = data['status'] as String?;
                  final category = (data['category'] as String?) ?? '';
                  return status != 'archived' && category.isNotEmpty;
                }).toList();

                // 카테고리별 카드 수 집계
                final Map<String, int> counts = {};
                for (final d in docs) {
                  final data = d.data();
                  final category = (data['category'] as String?) ?? '';
                  if (category.isEmpty) continue;
                  counts[category] = (counts[category] ?? 0) + 1;
                }

                var items = counts.entries
                    .map((e) => _CategoryInfo(name: e.key, count: e.value))
                    .toList();

                // 검색 필터
                final query = _searchCtrl.text.trim().toLowerCase();
                if (query.isNotEmpty) {
                  items = items
                      .where((c) => c.name.toLowerCase().contains(query))
                      .toList();
                }

                // 카드 수 기준 Top 10
                items.sort((a, b) => b.count.compareTo(a.count));
                if (items.length > 10) {
                  items = items.sublist(0, 10);
                }

                if (items.isEmpty) {
                  return const Center(child: Text('카테고리가 없습니다'));
                }

                return ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade50,
                        child: Text(
                          item.name.characters.first.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Text('카드 ${item.count}개'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CategoryDetailScreen(category: item.name),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryInfo {
  _CategoryInfo({required this.name, required this.count});
  final String name;
  final int count;
}

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    final String lower = category.toLowerCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('ideas')
            .where('categoryLower', isEqualTo: lower)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs.where((doc) {
            final data = doc.data();
            final status = data['status'] as String?;
            return status != 'archived';
          }).toList();

          if (docs.isEmpty) {
            return const Center(child: Text('이 카테고리에 속한 카드가 없습니다'));
          }

          // "가장 많은 사람들이 눌러본" 기준 정렬: viewUserIds 길이 기준
          docs.sort((a, b) {
            final av = ((a.data()['viewUserIds'] as List?)?.toSet().length ?? 0);
            final bv = ((b.data()['viewUserIds'] as List?)?.toSet().length ?? 0);
            return bv.compareTo(av);
          });

          return ListView.separated(
            itemCount: docs.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final d = docs[index];
              final data = d.data();
              final title = (data['title'] as String?) ?? '(제목 없음)';
              final content = (data['content'] as String?) ?? '';
              final viewUsers =
                  ((data['viewUserIds'] as List?)?.toSet().length ?? 0);

              return ListTile(
                title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (content.isNotEmpty)
                      Text(content,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text('클릭한 사람 수: $viewUsers',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade700)),
                  ],
                ),
                onTap: () async {
                  final uid = FirebaseAuth.instance.currentUser?.uid;
                  if (uid != null) {
                    try {
                      await FirebaseFirestore.instance
                          .collection('ideas')
                          .doc(d.id)
                          .update({
                        'viewUserIds': FieldValue.arrayUnion([uid]),
                      });
                    } catch (_) {
                      // 권한 부족 등은 무시 (뷰 카운트만 실패)
                    }
                  }

                  final pos = (data['position'] as Map?) ?? const {};
                  final double x =
                      (pos['x'] is num) ? (pos['x'] as num).toDouble() : 20000.0;
                  final double y =
                      (pos['y'] is num) ? (pos['y'] as num).toDouble() : 20000.0;

                  // 홈 화면을 새로 열어서 해당 카드 위치로 이동
                  if (!context.mounted) return;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(
                        initialCenter: Offset(x, y),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}


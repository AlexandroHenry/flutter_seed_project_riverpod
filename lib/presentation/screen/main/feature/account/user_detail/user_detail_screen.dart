import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_detail/provider/user_detail_provider.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_detail/provider/user_detail_state.dart';

class UserDetailScreen extends ConsumerStatefulWidget {
  const UserDetailScreen({super.key});

  @override
  ConsumerState<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends ConsumerState<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(userDetailProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<UserDetailState>(userDetailProvider, (prev, state) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (state.processing) {
          DialogUtil().showLoading(context: context);
        } else {
          DialogUtil().hideLoading(context: context);
        }
        if (state.errorMessage.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state.loggedOut) {
          DialogUtil().hideLoading(context: context);
          Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst);
          if (mounted) {
            context.go(AppPath.login.fullPath);
          }
        }
      });
    });

    final state = ref.watch(userDetailProvider);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: const Text('내 정보')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
                  const SizedBox(height: 16),
                  Text(
                    state.displayName.isNotEmpty ? state.displayName : 'User',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 32),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final result = await context.push(AppPath.userEdit.fullPath);
                      if (result == true && context.mounted) {
                        ref.read(userDetailProvider.notifier).load(reload: true);
                      }
                    },
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text('프로필 수정'),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: state.processing
                        ? null
                        : () => ref.read(userDetailProvider.notifier).logout(),
                    icon: state.processing
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Icon(Icons.logout),
                    label: Text(state.processing ? '로그아웃 중...' : '로그아웃'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_edit/provider/user_edit_provider.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_edit/provider/user_edit_state.dart';

class UserEditScreen extends ConsumerWidget {
  const UserEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<UserEditState>(userEditProvider, (prev, state) {
      if (state.errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
        ref.read(userEditProvider.notifier).clearError();
      }

      if (state.saved) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('저장되었습니다.')),
        );
        context.pop(true);
      }
    });

    final state = ref.watch(userEditProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보 수정'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '닉네임',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: TextEditingController(text: state.displayName)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: state.displayName.length),
                  ),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  ref.read(userEditProvider.notifier).updateDisplayName(value);
                },
                onSubmitted: (_) {
                  if (!state.processing) {
                    ref.read(userEditProvider.notifier).save();
                  }
                },
                decoration: const InputDecoration(
                  hintText: '닉네임을 입력해 주세요',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: state.processing
                    ? null
                    : () => ref.read(userEditProvider.notifier).save(),
                icon: state.processing
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : const Icon(Icons.save_outlined),
                label: Text(state.processing ? '저장 중...' : '저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

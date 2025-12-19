import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/screen/auth/verify/provider/verify_email_provider.dart';
import 'package:project_crew/presentation/screen/auth/verify/provider/verify_email_state.dart';
import 'package:project_crew/presentation/widget/bg/gradient_background.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:project_crew/presentation/widget/animation/animated_bubbles_background.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_container.dart';
import 'package:project_crew/presentation/widget/button/glass_back_button.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verifyEmailProvider);

    // Listen for verification success
    ref.listen<VerifyEmailState>(verifyEmailProvider, (prev, state) {
      if (prev?.verified != state.verified && state.verified) {
        // 인증 완료 시 홈 화면으로 이동
        if (context.mounted) {
          context.go(AppPath.main.fullPath);
          
          // Material Navigator 스택 정리
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              Navigator.of(context, rootNavigator: true)
                  .popUntil((route) => route.isFirst);
            }
          });
        }
      }

      // Handle error messages
      if (state.errorMessage.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;

          final message = state.errorMessage;
          Color? backgroundColor;

          if (message.startsWith('SUCCESS:')) {
            backgroundColor = Colors.green;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message.replaceFirst('SUCCESS:', '')),
                backgroundColor: backgroundColor,
              ),
            );
          } else if (message.startsWith('WARNING:')) {
            backgroundColor = Colors.orange;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message.replaceFirst('WARNING:', '')),
                backgroundColor: backgroundColor,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          }

          // Clear error after showing
          ref.read(verifyEmailProvider.notifier).clearError();
        });
      }
    });

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            // Background gradient
            Positioned.fill(
              child: GradientBackground(
                gradient: AppGradients.loginBackground,
              ),
            ),
            // Bubbly blur overlay
            const Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBubblesBackground(speed: 5),
              ),
            ),
            // Content
            Positioned.fill(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 40.0,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - 80.0,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 520,
                          ),
                          child: GlassContainer(
                            blur: 48.0,
                            backgroundOpacity: 0.16,
                            borderOpacity: 0.30,
                            borderWidth: 1.2,
                            shadowBlurRadius: 28.0,
                            shadowColor: Colors.white.withOpacity(0.32),
                            padding: const EdgeInsets.all(24.0),
                            borderRadius: 20.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  size: 80,
                                  color: Colors.black.withOpacity(0.95),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  '메일을 확인해 주세요',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Text(
                                  '$email\n\n위 주소로 인증 메일을 보냈습니다.\n메일의 링크를 눌러 인증을 완료해 주세요.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.85),
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 32.0),
                                FilledButton.icon(
                                  style: FilledButton.styleFrom(
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: state.checking
                                      ? null
                                      : () => ref
                                          .read(verifyEmailProvider.notifier)
                                          .checkVerified(),
                                  icon: state.checking
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.black),
                                          ),
                                        )
                                      : const Icon(Icons.check_circle_outline),
                                  label: Text(
                                      state.checking ? '확인 중...' : '인증 완료했어요'),
                                ),
                                const SizedBox(height: 12.0),
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                      color: Colors.black.withOpacity(0.85),
                                    ),
                                    overlayColor: Colors.black.withOpacity(0.08),
                                  ),
                                  onPressed: state.sending
                                      ? null
                                      : () => ref
                                          .read(verifyEmailProvider.notifier)
                                          .resendEmail(),
                                  icon: state.sending
                                      ? SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(
                                              Colors.black,
                                            ),
                                          ),
                                        )
                                      : const Icon(Icons.refresh),
                                  label: Text(
                                      state.sending ? '전송 중...' : '인증 메일 다시 보내기'),
                                ),
                                const SizedBox(height: 24),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    overlayColor: Colors.black12,
                                  ),
                                  onPressed: () async {
                                    await ref
                                        .read(verifyEmailProvider.notifier)
                                        .signOut();
                                    if (context.mounted) {
                                      context.pop();
                                    }
                                  },
                                  child: const Text('로그인 화면으로 돌아가기'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Back button (glassmorphic)
            Positioned(
              top: 8,
              left: 20,
              child: SafeArea(
                child: GlassBackButton(
                  onTap: () async {
                    await ref.read(verifyEmailProvider.notifier).signOut();
                    if (context.mounted) {
                      context.pop();
                    }
                  },
                  iconColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

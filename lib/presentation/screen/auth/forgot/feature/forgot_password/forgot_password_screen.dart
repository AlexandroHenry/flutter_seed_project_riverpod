import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_button.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_container.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_text_field.dart';
import 'package:project_crew/presentation/widget/modal/modal_listener.dart';
import 'package:project_crew/presentation/widget/bg/gradient_background.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:project_crew/presentation/widget/animation/animated_bubbles_background.dart';
import 'provider/forgot_password_provider.dart';
import 'provider/forgot_password_state.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(forgotPasswordProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ForgotPasswordState>(forgotPasswordProvider, (prev, state) {
      if ((prev?.sent != state.sent) && state.sent) {
        // Navigate to verify code screen using go_router
        context.push(AppPath.forgotPasswordVerify.fullPath, extra: _emailController.text.trim());
      }
    });
    final state = ref.watch(forgotPasswordProvider);
    return ModalListener(
      showLoading: state.modal.showLoading,
      error: state.modal.error,
      errorDialogData: state.modal.dialogData,
      child: Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: GradientBackground(
                  gradient: AppGradients.loginBackground,
                ),
              ),
              const Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedBubblesBackground(speed: 5),
                ),
              ),
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
                            constraints: const BoxConstraints(maxWidth: 480),
                            child: GlassContainer(
                              backgroundOpacity: 0.08,
                              borderOpacity: 0.22,
                              blur: 24.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    '비밀번호 재설정',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    '가입하신 이메일로 비밀번호 재설정 코드를 보내드려요.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.75),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  GlassTextField(
                                    controller: _emailController,
                                    focusNode: _emailFocus,
                                    hintText: '이메일',
                                    textInputAction: TextInputAction.done,
                                    onSubmitted: (_) => _onSubmit(),
                                    prefixIcon: Icons.email_outlined,
                                    obscureText: false,
                                    textColor: Colors.black,
                                    hintColor: Colors.black.withOpacity(0.6),
                                    iconColor: Colors.black,
                                    keyboardType: TextInputType.emailAddress,
                                    blur: 24.0,
                                  ),
                                  const SizedBox(height: 20.0),
                                  GlassButton(
                                    text: state.modal.showLoading ? '전송 중...' : '코드 전송하기',
                                    onTap: () {
                                      if (state.modal.showLoading) return;
                                      _onSubmit();
                                    },
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    final String email = _emailController.text.trim();
    if (email.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일을 입력해 주세요.')),
      );
      return;
    }
    ref.read(forgotPasswordProvider.notifier).submit(email: email);
  }
}

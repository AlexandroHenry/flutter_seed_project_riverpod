import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_button.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_container.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_text_field.dart';
import 'package:project_crew/presentation/widget/modal/modal_listener.dart';
import 'package:project_crew/presentation/widget/bg/gradient_background.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:project_crew/presentation/widget/animation/animated_bubbles_background.dart';
import '../../forgot/provider/change_password_provider.dart';
import '../../forgot/provider/change_password_state.dart';

class ChangePasswordWithCodeScreen extends ConsumerStatefulWidget {
  const ChangePasswordWithCodeScreen({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  ConsumerState<ChangePasswordWithCodeScreen> createState() =>
      _ChangePasswordWithCodeScreenState();
}

class _ChangePasswordWithCodeScreenState
    extends ConsumerState<ChangePasswordWithCodeScreen> {
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pw2Controller = TextEditingController();
  final FocusNode _pwFocus = FocusNode();
  final FocusNode _pw2Focus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(changePasswordProvider.notifier).load();
    });
  }

  @override
  void dispose() {
    _pwController.dispose();
    _pw2Controller.dispose();
    _pwFocus.dispose();
    _pw2Focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ChangePasswordState>(changePasswordProvider, (prev, state) {
      if ((prev?.completed != state.completed) && state.completed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('비밀번호가 변경되었습니다. 로그인해 주세요.')),
        );
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });
    final state = ref.watch(changePasswordProvider);
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
                                        '새 비밀번호 설정',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 12.0),
                                      GlassTextField(
                                        controller: _pwController,
                                        focusNode: _pwFocus,
                                        hintText: '새 비밀번호',
                                        textInputAction: TextInputAction.next,
                                        onSubmitted: (_) => _pw2Focus.requestFocus(),
                                        prefixIcon: Icons.lock_outline,
                                        obscureText: true,
                                        showObscureToggle: true,
                                        textColor: Colors.black,
                                        hintColor: Colors.black.withOpacity(0.6),
                                        iconColor: Colors.black,
                                        blur: 24.0,
                                      ),
                                      const SizedBox(height: 12.0),
                                      GlassTextField(
                                        controller: _pw2Controller,
                                        focusNode: _pw2Focus,
                                        hintText: '새 비밀번호 확인',
                                        textInputAction: TextInputAction.done,
                                        onSubmitted: (_) => _onSubmit(),
                                        prefixIcon: Icons.lock_reset_outlined,
                                        obscureText: true,
                                        showObscureToggle: true,
                                        textColor: Colors.black,
                                        hintColor: Colors.black.withOpacity(0.6),
                                        iconColor: Colors.black,
                                        blur: 24.0,
                                      ),
                                      const SizedBox(height: 16.0),
                                      GlassButton(
                                        text: state.modal.showLoading ? '변경 중...' : '변경하기',
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

  void _onSubmit() {
    final pw = _pwController.text.trim();
    final pw2 = _pw2Controller.text.trim();
    if (pw.isEmpty || pw2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('새 비밀번호를 입력해 주세요.')),
      );
      return;
    }
    if (pw != pw2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')),
      );
      return;
    }
    ref.read(changePasswordProvider.notifier).submit(
      email: widget.email,
      code: widget.code,
      newPassword: pw,
    );
  }
}



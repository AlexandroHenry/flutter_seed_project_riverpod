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
import 'provider/verify_code_provider.dart';
import 'provider/verify_code_state.dart';

class VerifyCodeScreen extends ConsumerStatefulWidget {
  const VerifyCodeScreen({
    super.key,
    required this.email,
    this.returnCode = false,
    this.forSignup = false,
  });
  final String email;
  final bool returnCode;
  final bool forSignup;

  @override
  ConsumerState<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends ConsumerState<VerifyCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(verifyCodeProvider.notifier).load(forSignup: widget.forSignup);
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<VerifyCodeState>(verifyCodeProvider, (prev, state) {
      if ((prev?.verified != state.verified) && state.verified) {
        if (widget.returnCode) {
          context.pop(_codeController.text.trim());
        } else {
          context.pushReplacement(
            AppPath.forgotPasswordChange.fullPath,
            extra: {
              'email': widget.email,
              'code': _codeController.text.trim(),
            },
          );
        }
      }
    });
    final state = ref.watch(verifyCodeProvider);
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
                                  Text(
                                    "'${widget.email}'로 받은 6자리 코드를 입력해 주세요.",
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16.0),
                                  GlassTextField(
                                    controller: _codeController,
                                    focusNode: _codeFocus,
                                    hintText: '인증 코드',
                                    textInputAction: TextInputAction.done,
                                    onSubmitted: (_) => _onVerify(),
                                    prefixIcon: Icons.verified_outlined,
                                    obscureText: false,
                                    textColor: Colors.black,
                                    hintColor: Colors.black.withOpacity(0.6),
                                    iconColor: Colors.black,
                                    keyboardType: TextInputType.number,
                                    blur: 24.0,
                                  ),
                                  const SizedBox(height: 16.0),
                                  GlassButton(
                                    text: state.modal.showLoading ? '확인 중...' : '인증하기',
                                    onTap: () {
                                      if (state.modal.showLoading) return;
                                      _onVerify();
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

  void _onVerify() {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('인증 코드를 입력해 주세요.')),
      );
      return;
    }
    ref.read(verifyCodeProvider.notifier).submit(email: widget.email, code: code);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/screen/auth/signup/provider/signup_provider.dart';
import 'package:project_crew/presentation/screen/auth/signup/provider/signup_state.dart';
import 'package:project_crew/presentation/widget/animation/animated_bubbles_background.dart';
import 'package:project_crew/presentation/widget/bg/gradient_background.dart';
import 'package:project_crew/presentation/screen/auth/signup/view/signup_card.dart';
import 'package:project_crew/presentation/widget/button/glass_back_button.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwConfirmController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _pwFocus = FocusNode();
  final FocusNode _pwConfirmFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(signupProvider.notifier).load();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();
    _emailFocus.dispose();
    _pwFocus.dispose();
    _pwConfirmFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SignupState>(signupProvider, (prev, state) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        
        if (state.modal.showLoading) {
          DialogUtil().showLoading(context: context);
        } else {
          DialogUtil().hideLoading(context: context);
        }

        final prevToken = prev?.account.accessToken ?? '';
        if (prevToken != state.account.accessToken && 
            state.account.accessToken == '__VERIFY_EMAIL__') {
          try { await DialogUtil().hideLoading(context: context); } catch (_) {}
          if (context.mounted) {
            final String email = _emailController.text.trim();
            context.push(AppPath.verifyEmail.fullPath, extra: email);
          }
        }

        final prevErrorHash = prev?.modal.error.hashCode ?? 0;
        if (prevErrorHash != state.modal.error.hashCode) {
          final dialogData = state.modal.dialogData;
          final error = state.modal.error;
          if ((error.code >= 300 && error.code != 304) || error.code == -1) {
            DialogUtil().showConfirmDialog(
              context: context,
              canUserClose: dialogData.canUserClose ?? true,
              data: DialogData(
                title: dialogData.title.isEmpty ? '알림' : dialogData.title,
                contents: dialogData.contents.isEmpty ? error.message : dialogData.contents,
                confirmText: dialogData.confirmText.isEmpty ? '확인' : dialogData.confirmText,
                onConfirm: () => dialogData.onConfirm?.call(),
                onUserClose: () => dialogData.onUserClose?.call(),
                data: dialogData.data,
              ),
            );
          }
        }
      });
    });

    ref.watch(signupProvider);

    return Scaffold(
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
            Positioned.fill(
              child: const IgnorePointer(
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
                          constraints: const BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: SignupCard(
                            emailController: _emailController,
                            passwordController: _pwController,
                            passwordConfirmController: _pwConfirmController,
                            emailFocus: _emailFocus,
                            passwordFocus: _pwFocus,
                            passwordConfirmFocus: _pwConfirmFocus,
                            onSubmit: _onSignUp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 8,
              left: 20,
              child: SafeArea(
                child: GlassBackButton(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignUp() {
    final String email = _emailController.text.trim();
    final String pw = _pwController.text.trim();
    final String pw2 = _pwConfirmController.text.trim();
    
    if (email.isEmpty || pw.isEmpty || pw2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일과 비밀번호를 입력해 주세요.')),
      );
      return;
    }
    
    if (pw != pw2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')),
      );
      return;
    }
    
    ref.read(signupProvider.notifier).signUp(email: email, password: pw);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/presentation/widget/animation/animated_bubbles_background.dart';
import 'package:project_crew/presentation/screen/auth/login/view/login_card.dart';
import 'package:project_crew/presentation/widget/bg/gradient_background.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/presentation/screen/auth/login/provider/login_provider.dart';
import 'package:project_crew/presentation/screen/auth/login/provider/login_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final FocusNode _idFocus = FocusNode();
  final FocusNode _pwFocus = FocusNode(); 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(loginProvider.notifier).load();
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    _idFocus.dispose();
    _pwFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginProvider, (prev, state) async {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        if (state.modal.showLoading) {
          DialogUtil().showLoading(context: context);
        } else {
          DialogUtil().hideLoading(context: context);
        }
        final prevToken = prev?.account.accessToken ?? '';
        if (prevToken != state.account.accessToken && state.account.accessToken.isNotEmpty) {
          try { await DialogUtil().hideLoading(context: context); } catch (_) {}
          if (mounted) {
            context.go(AppPath.main.fullPath);
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

    ref.watch(loginProvider);

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
            Positioned.fill(
              child: const IgnorePointer(
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
                            maxWidth: 480,
                          ),
                          child: LoginCard(
                            idController: _idController,
                            pwController: _pwController,
                            idFocus: _idFocus,
                            pwFocus: _pwFocus,
                            onSubmit: _onLogin,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // No back button on Login screen
          ],
        ),
      ),
    );
  }

  // Using reusable GlassTextField instead of local builder.

  void _onLogin() {
    final String id = _idController.text.trim();
    final String pw = _pwController.text.trim();
    if (id.isEmpty || pw.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('아이디와 비밀번호를 입력해 주세요.')));
      return;
    }
    ref.read(loginProvider.notifier).login(id: id, password: pw);
  }
}

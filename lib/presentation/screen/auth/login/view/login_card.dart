import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_container.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_text_field.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_button.dart';
import 'package:project_crew/presentation/screen/auth/forgot/forgot_password_screen.dart';
import 'package:project_crew/presentation/screen/auth/find_id/find_id_screen.dart';

class LoginCard extends StatelessWidget {
  final TextEditingController idController;
  final TextEditingController pwController;
  final FocusNode idFocus;
  final FocusNode pwFocus;
  final VoidCallback onSubmit;

  const LoginCard({
    super.key,
    required this.idController,
    required this.pwController,
    required this.idFocus,
    required this.pwFocus,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      backgroundOpacity: 0.12,
      borderOpacity: 0.26,
      blur: 36.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8.0),
          const Text(
            'Welcome Back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '로그인을 진행해 주세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.85),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 28.0),
          GlassTextField(
            controller: idController,
            focusNode: idFocus,
            hintText: '이메일',
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => pwFocus.requestFocus(),
            prefixIcon: Icons.person_outline,
            obscureText: false,
            textColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.6),
            iconColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@._+\-]")),
            ],
            blur: 36.0,
          ),
          const SizedBox(height: 16.0),
          GlassTextField(
            controller: pwController,
            focusNode: pwFocus,
            hintText: '비밀번호',
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => onSubmit(),
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            showObscureToggle: true,
            textColor: Colors.black,
            hintColor: Colors.black.withValues(alpha: 0.6),
            iconColor: Colors.black,
            blur: 36.0,
          ),
          const SizedBox(height: 24.0),
          GlassButton(
            text: '로그인',
            onTap: onSubmit,
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '아직 계정이 없으신가요?',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.80),
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 8.0),
              TextButton(
                onPressed: () {
                  context.push('/signup');
                },
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FindIdScreen()),
                  );
                },
                child: const Text(
                  '아이디 찾기',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              TextButton(
                onPressed: () {
                  context.push(AppPath.forgotPassword.fullPath);
                },
                child: const Text(
                  '비밀번호 찾기',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

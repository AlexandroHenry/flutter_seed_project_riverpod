import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_button.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_container.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_text_field.dart';

class SignupCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final FocusNode passwordConfirmFocus;
  final VoidCallback onSubmit;

  const SignupCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmController,
    required this.emailFocus,
    required this.passwordFocus,
    required this.passwordConfirmFocus,
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
            'Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '회원가입을 진행해 주세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.85),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 28.0),
          GlassTextField(
            controller: emailController,
            focusNode: emailFocus,
            hintText: '이메일',
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => passwordFocus.requestFocus(),
            prefixIcon: Icons.email_outlined,
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
            controller: passwordController,
            focusNode: passwordFocus,
            hintText: '비밀번호',
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => passwordConfirmFocus.requestFocus(),
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            showObscureToggle: true,
            textColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.6),
            iconColor: Colors.black,
            blur: 36.0,
          ),
          const SizedBox(height: 16.0),
          GlassTextField(
            controller: passwordConfirmController,
            focusNode: passwordConfirmFocus,
            hintText: '비밀번호 확인',
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => onSubmit(),
            prefixIcon: Icons.lock_reset_outlined,
            obscureText: true,
            showObscureToggle: true,
            textColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.6),
            iconColor: Colors.black,
            blur: 36.0,
          ),
          const SizedBox(height: 24.0),
          GlassButton(
            text: '회원가입',
            onTap: onSubmit,
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:project_crew/presentation/screen/auth/forgot/forgot_password_screen.dart';
import 'package:project_crew/presentation/screen/auth/signup/signup_screen.dart';

class FindIdScreen extends StatelessWidget {
  const FindIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아이디 찾기'),
      ),
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
                  const Text(
                    '아이디 안내',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    '이 서비스의 아이디는 가입 시 사용한 이메일 주소입니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 24.0),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text('비밀번호 재설정 하러가기'),
                  ),
                  const SizedBox(height: 8.0),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text('회원가입 하기'),
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



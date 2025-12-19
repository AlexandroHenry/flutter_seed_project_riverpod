import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/screen/splash/splash_screen.dart';
import 'package:project_crew/presentation/screen/auth/login/login_screen.dart';
import 'package:project_crew/presentation/screen/auth/signup/signup_screen.dart';
import 'package:project_crew/presentation/screen/auth/verify/verify_email_screen.dart';
import 'package:project_crew/presentation/screen/auth/forgot/feature/forgot_password/forgot_password_screen.dart';
import 'package:project_crew/presentation/screen/auth/forgot/feature/verify_code/verify_code_screen.dart';
import 'package:project_crew/presentation/screen/auth/forgot/feature/change_password/change_password_screen.dart';
import 'package:project_crew/presentation/screen/main/main_screen.dart';
import 'package:project_crew/presentation/screen/main/feature/home/home_screen.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_detail/user_detail_screen.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_edit/user_edit_screen.dart';

part 'app_go_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
      initialLocation: AppPath.splash.fullPath,
      routes: <GoRoute>[
        GoRoute(
          path: AppPath.splash.fullPath,
          name: 'splash',
          builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppPath.login.fullPath,
          name: 'login',
          builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppPath.signup.fullPath,
          name: 'signup',
          builder: (BuildContext context, GoRouterState state) => const SignupScreen(),
        ),
        GoRoute(
          path: AppPath.verifyEmail.fullPath,
          name: 'verify_email',
          builder: (BuildContext context, GoRouterState state) {
            final email = state.extra as String;
            return VerifyEmailScreen(email: email);
          },
        ),
        GoRoute(
          path: AppPath.main.fullPath,
          name: 'main',
          builder: (BuildContext context, GoRouterState state) => const MainScreen(),
        ),
        GoRoute(
          path: AppPath.home.fullPath,
          name: 'home',
          builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppPath.userDetail.fullPath,
          name: 'user_detail',
          builder: (BuildContext context, GoRouterState state) => const UserDetailScreen(),
        ),
        GoRoute(
          path: AppPath.userEdit.fullPath,
          name: 'user_edit',
          builder: (BuildContext context, GoRouterState state) => const UserEditScreen(),
        ),
        // Forgot Password Routes
        GoRoute(
          path: AppPath.forgotPassword.fullPath,
          name: 'forgot_password',
          builder: (BuildContext context, GoRouterState state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: AppPath.forgotPasswordVerify.fullPath,
          name: 'verify_code',
          builder: (BuildContext context, GoRouterState state) {
            final email = state.extra as String;
            return VerifyCodeScreen(email: email);
          },
        ),
        GoRoute(
          path: AppPath.forgotPasswordChange.fullPath,
          name: 'change_password',
          builder: (BuildContext context, GoRouterState state) {
            final params = state.extra as Map<String, String>;
            return ChangePasswordScreen(email: params['email']!, code: params['code']!);
          },
        ),
      ]);
}

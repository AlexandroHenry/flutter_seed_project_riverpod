import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart';
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/params/auth/signup/sign_up_params.dart';
import 'package:project_crew/domain/params/auth/signup/request_signup_code_params.dart';
import 'package:project_crew/domain/params/auth/signup/verify_signup_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/reset_password_params.dart';
import 'package:project_crew/domain/params/auth/reset/request_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/verify_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/reset/update_password_with_code_params.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';

class FirebaseAuthRepositoryImpl extends AuthRepository {
  FirebaseAuthRepositoryImpl({
    FirebaseAuth? firebaseAuth,
    FirebaseFunctions? functions,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _functions = functions ??
            FirebaseFunctions.instanceFor(
              region: const String.fromEnvironment(
                'FIREBASE_FUNCTIONS_REGION',
                defaultValue: 'us-central1',
              ),
            );

  final FirebaseAuth _firebaseAuth;
  final FirebaseFunctions _functions;

  @override
  Future<ResponseModel> login(LoginParams params) async {
    try {
      final UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.id,
        password: params.password,
      );
      final idToken = await cred.user?.getIdToken() ?? '';

      // Note: Firebase doesn't expose refresh tokens to clients.
      // We return accessToken=idToken and leave refreshToken empty.
      return ResponseModel<AccountEntity>(
        code: 200,
        result: AccountEntity(
          refreshToken: '',
          accessToken: idToken,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResponseModel<AccountEntity>(
        code: _toHttpLikeCode(e.code),
        message: e.message ?? 'FirebaseAuthException',
        error: e.code,
        result: null,
      );
    } catch (_) {
      return const ResponseModel<AccountEntity>(
        code: 500,
        message: 'Unknown error',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> signUp(SignUpParams params) async {
    try {
      final UserCredential cred =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      if (params.displayName != null && params.displayName!.isNotEmpty) {
        await cred.user?.updateDisplayName(params.displayName);
      }
      // 이메일 인증 메일 전송
      await cred.user?.sendEmailVerification();
      
      // ⚠️ 로그아웃하지 않음 - VerifyEmailScreen에서 재발송을 위해 currentUser가 필요
      // 인증 대기 상태임을 나타내는 특수 토큰 반환
      return ResponseModel<AccountEntity>(
        code: 200,
        result: AccountEntity(
          refreshToken: '',
          accessToken: 'PENDING_EMAIL_VERIFICATION',
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResponseModel<AccountEntity>(
        code: _toHttpLikeCode(e.code),
        message: e.message ?? 'FirebaseAuthException',
        error: e.code,
        result: null,
      );
    } catch (_) {
      return const ResponseModel<AccountEntity>(
        code: 500,
        message: 'Unknown error',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> resetPassword(ResetPasswordParams params) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: params.email);
      return const ResponseModel<void>(code: 200);
    } on FirebaseAuthException catch (e) {
      return ResponseModel<void>(
        code: _toHttpLikeCode(e.code),
        message: e.message ?? 'FirebaseAuthException',
        error: e.code,
        result: null,
      );
    } catch (_) {
      return const ResponseModel<void>(
        code: 500,
        message: 'Unknown error',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> requestResetCode(RequestResetCodeParams params) async {
    try {
      final callable = _functions.httpsCallable('requestPasswordResetCode');
      await callable.call(<String, dynamic>{
        'email': params.email,
      });
      return const ResponseModel<void>(code: 200);
    } on FirebaseFunctionsException catch (e) {
      return ResponseModel<void>(
        code: _functionsCodeToHttp(e.code),
        message: e.message ?? 'Functions error (${e.code})',
        error: e.code,
        result: null,
      );
    } on PlatformException catch (e) {
      return ResponseModel<void>(
        code: 500,
        message:
            'Cloud Functions plugin/platform not available. Rebuild the app and ensure Firebase is configured. (${e.code})',
        error: e.code,
        result: null,
      );
    } catch (e) {
      return ResponseModel<void>(
        code: 500,
        message: 'Unexpected error: $e',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> verifyResetCode(VerifyResetCodeParams params) async {
    try {
      final callable = _functions.httpsCallable('verifyPasswordResetCode');
      await callable.call(<String, dynamic>{
        'email': params.email,
        'code': params.code,
      });
      return const ResponseModel<void>(code: 200);
    } on FirebaseFunctionsException catch (e) {
      return ResponseModel<void>(
        code: _functionsCodeToHttp(e.code),
        message: e.message ?? 'Functions error (${e.code})',
        error: e.code,
        result: null,
      );
    } on PlatformException catch (e) {
      return ResponseModel<void>(
        code: 500,
        message:
            'Cloud Functions plugin/platform not available. Rebuild the app and ensure Firebase is configured. (${e.code})',
        error: e.code,
        result: null,
      );
    } catch (e) {
      return ResponseModel<void>(
        code: 500,
        message: 'Unexpected error: $e',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> requestSignupCode(RequestSignupCodeParams params) async {
    try {
      final callable = _functions.httpsCallable('requestSignupCode');
      await callable.call(<String, dynamic>{
        'email': params.email,
      });
      return const ResponseModel<void>(code: 200);
    } on FirebaseFunctionsException catch (e) {
      // Fallback: if dedicated signup code function is not deployed,
      // reuse the password reset code function to deliver a code.
      if (e.code == 'not-found') {
        try {
          final fallback = _functions.httpsCallable('requestPasswordResetCode');
          await fallback.call(<String, dynamic>{
            'email': params.email,
          });
          return const ResponseModel<void>(code: 200);
        } on FirebaseFunctionsException catch (fe) {
          return ResponseModel<void>(
            code: _functionsCodeToHttp(fe.code),
            message: fe.message ?? 'Functions error (${fe.code})',
            error: fe.code,
            result: null,
          );
        }
      }
      return ResponseModel<void>(
        code: _functionsCodeToHttp(e.code),
        message: e.message ?? 'Functions error (${e.code})',
        error: e.code,
        result: null,
      );
    } on PlatformException catch (e) {
      return ResponseModel<void>(
        code: 500,
        message:
            'Cloud Functions plugin/platform not available. Rebuild the app and ensure Firebase is configured. (${e.code})',
        error: e.code,
        result: null,
      );
    } catch (e) {
      return ResponseModel<void>(
        code: 500,
        message: 'Unexpected error: $e',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> verifySignupCode(VerifySignupCodeParams params) async {
    try {
      final callable = _functions.httpsCallable('verifySignupCode');
      await callable.call(<String, dynamic>{
        'email': params.email,
        'code': params.code,
      });
      return const ResponseModel<void>(code: 200);
    } on FirebaseFunctionsException catch (e) {
      // Fallback: if dedicated signup code verification is not deployed,
      // reuse the password reset code verification.
      if (e.code == 'not-found') {
        try {
          final fallback = _functions.httpsCallable('verifyPasswordResetCode');
          await fallback.call(<String, dynamic>{
            'email': params.email,
            'code': params.code,
          });
          return const ResponseModel<void>(code: 200);
        } on FirebaseFunctionsException catch (fe) {
          return ResponseModel<void>(
            code: _functionsCodeToHttp(fe.code),
            message: fe.message ?? 'Functions error (${fe.code})',
            error: fe.code,
            result: null,
          );
        }
      }
      return ResponseModel<void>(
        code: _functionsCodeToHttp(e.code),
        message: e.message ?? 'Functions error (${e.code})',
        error: e.code,
        result: null,
      );
    } on PlatformException catch (e) {
      return ResponseModel<void>(
        code: 500,
        message:
            'Cloud Functions plugin/platform not available. Rebuild the app and ensure Firebase is configured. (${e.code})',
        error: e.code,
        result: null,
      );
    } catch (e) {
      return ResponseModel<void>(
        code: 500,
        message: 'Unexpected error: $e',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<ResponseModel> updatePasswordWithCode(UpdatePasswordWithCodeParams params) async {
    try {
      final callable = _functions.httpsCallable('updatePasswordWithCode');
      await callable.call(<String, dynamic>{
        'email': params.email,
        'code': params.code,
        'newPassword': params.newPassword,
      });
      return const ResponseModel<void>(code: 200);
    } on FirebaseFunctionsException catch (e) {
      return ResponseModel<void>(
        code: _functionsCodeToHttp(e.code),
        message: e.message ?? 'Functions error (${e.code})',
        error: e.code,
        result: null,
      );
    } on PlatformException catch (e) {
      return ResponseModel<void>(
        code: 500,
        message:
            'Cloud Functions plugin/platform not available. Rebuild the app and ensure Firebase is configured. (${e.code})',
        error: e.code,
        result: null,
      );
    } catch (e) {
      return ResponseModel<void>(
        code: 500,
        message: 'Unexpected error: $e',
        error: 'unknown',
        result: null,
      );
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  int _toHttpLikeCode(String code) {
    switch (code) {
      case 'invalid-email':
      case 'missing-email':
      case 'missing-password':
        return 400;
      case 'user-disabled':
      case 'user-not-found':
      case 'wrong-password':
        return 401;
      case 'too-many-requests':
        return 429;
      default:
        return 500;
    }
  }

  int _functionsCodeToHttp(String code) {
    switch (code) {
      case 'not-found':
        return 404;
      case 'permission-denied':
        return 403;
      case 'unavailable':
        return 503;
      case 'invalid-argument':
        return 400;
      case 'deadline-exceeded':
        return 504;
      default:
        return 500;
    }
  }
}


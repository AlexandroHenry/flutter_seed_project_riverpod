import 'package:flutter/material.dart';
import 'package:project_crew/core/social/platform_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class ApplePlatformSignInImpl extends PlatformSignIn<AuthorizationCredentialAppleID> {

  ApplePlatformSignInImpl({
    required this.webServiceId,
    required this.redirectUrl,
    this.context,
  });

  final BuildContext? context;
  AuthorizationCredentialAppleID? credential;

  final String webServiceId;
  final String redirectUrl;

  @override
  Future<AuthorizationCredentialAppleID?> signIn() async {
    try {
      // if (!kIsWeb && Platform.isAndroid) {
      //   credential = await SignInWithAppleForAndroid().signInApple(
      //     context ?? ContextHelper.currentContext!,
      //     WebAuthenticationOptions(
      //       clientId: webServiceId,
      //       redirectUri: Uri.parse(redirectUrl),
      //     ),
      //     // userAgent: 'AINoon',
      //     callbackScheme: SignInScheme(scheme: 'signinainoon', host: 'callback'),
      //     state: 'ainoon',
      //   );
      // } else {
        credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
            clientId: webServiceId,
            redirectUri: Uri.parse(redirectUrl),
          ),
          state: 'ainoon',
        );
      // }
      return credential;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<String> getIdToken() async {
    return credential?.identityToken ?? '';
  }

  @override
  Future<String> signInAndIdToken() async {
    await signIn();
    return await getIdToken();
  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<String> getAccessToken() async {
    throw UnimplementedError();
  }
}
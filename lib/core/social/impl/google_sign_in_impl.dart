import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_crew/core/social/platform_sign_in.dart';

class GooglePlatformSignInImpl extends PlatformSignIn<GoogleSignInAccount> {

  GooglePlatformSignInImpl({
    required this.scope,
    this.serverClientId,
  });

  final List<String> scope;
  final String? serverClientId;

  GoogleSignInAccount? _currentUser;

  @override
  Future<GoogleSignInAccount?> signIn() async {
    try {
      await signOut();
    } catch (e) {
      debugPrint('google previous sign out error : ${e.toString()}');
    }

    try {
      GoogleSignIn.instance.initialize(
        serverClientId: serverClientId,
      );
      _currentUser = await GoogleSignIn.instance.authenticate(
        scopeHint: scope,
      );
      return _currentUser;
    } catch (e) {
      debugPrint('google sign in error : ${e.toString()}');
      return null;
    }
  }

  @override
  Future<String> getIdToken() async {
    try {
      if (_currentUser == null) {
        debugPrint('google current user data null');
        return '';
      }

      var result = _currentUser?.authentication;
      return result?.idToken ?? '';
    } catch (e) {
      debugPrint('google current user data null');
      return '';
    }
  }

  /// google API token
  @override
  Future<String> getAccessToken() async {
    try {
      if (_currentUser == null) {
        debugPrint('google current user data null');
        return '';
      }

      final GoogleSignInClientAuthorization? authorization =
      await _currentUser?.authorizationClient.authorizationForScopes(scope);
      return authorization?.accessToken ?? '';
    } catch (e) {
      debugPrint('google current user data null');
      return '';
    }
  }

  @override
  Future<String> signInAndIdToken() async {
    await signIn();
    return await getIdToken();
  }

  @override
  Future<void> signOut() => GoogleSignIn.instance.disconnect();

  Future<bool> isGoogleSignedIn() async {
    return _currentUser != null;
  }
}
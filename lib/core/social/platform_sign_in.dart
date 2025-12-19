abstract class PlatformSignIn<T> {
  Future<T?> signIn();
  Future<void> signOut();
  Future<String> getIdToken();
  Future<String> getAccessToken();
  Future<String> signInAndIdToken();
}
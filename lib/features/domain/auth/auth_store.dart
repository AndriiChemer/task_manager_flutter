abstract class AuthStore {
  Future<void> saveToken(String token);

  Future<String> getToken();
}
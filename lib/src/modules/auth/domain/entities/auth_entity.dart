final class AuthEntity {
  String username;
  String password;

  AuthEntity(
    this.username,
    this.password,
  );

  void setUsername(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }
}

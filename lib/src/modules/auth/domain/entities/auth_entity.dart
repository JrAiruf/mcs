final class AuthEntity {
  String? username;
  String? password;

  AuthEntity({
    this.username,
    this.password,
  });

  void setUsername(String? value) {
    if (value != null && value.isNotEmpty) {
      username = value;
    } else {
      value = null;
    }
  }

  void setPassword(String? value) {
    if (value != null && value.isNotEmpty) {
      password = value;
    } else {
      value = null;
    }
  }
}

import '../../../../imports.dart';

class AuthEntityAdapter {
  final String username;
  final String password;

  AuthEntityAdapter({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory AuthEntityAdapter.fromMap(Map<String, dynamic> map) {
    return AuthEntityAdapter(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  factory AuthEntityAdapter.toAdapter(AuthEntity entity) {
    return AuthEntityAdapter(
      username: entity.username,
      password: entity.password,
    );
  }

  static AuthEntity toEntity(Map<String, dynamic> map) {
    return AuthEntity(
      map['username'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthEntityAdapter.fromJson(String source) => AuthEntityAdapter.fromMap(json.decode(source) as Map<String, dynamic>);
}

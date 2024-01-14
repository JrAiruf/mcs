import 'package:mcs/src/app_imports.dart';

abstract class AuthMockData {
  static final authEntity = AuthEntity(username: "username", password: "password");
  static final authMap = <String, dynamic>{"username": "app", "password": "2nq25nf7"};
}

import 'package:mcs/src/imports.dart';

abstract class AuthMockData {
  static final authEntity = AuthEntity("username", "password");
  static final authMap = <String, dynamic>{"username": "app", "password": "2nq25nf7"};
}
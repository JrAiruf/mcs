import 'package:mcs/src/imports.dart';

void main() {
  late AuthEntity authEntity;
  setUp(
    () {
      authEntity = AuthEntity(
        username: null,
        password: null,
      );
    },
  );
  group(
    "SetUsername Function should",
    () {
      test(
        "assign the given value to username property",
        () {
          authEntity.setUsername("User 1");
          expect(authEntity.username, equals("User 1"));
        },
      );
      test(
        "assign no value to username property",
        () {
          authEntity.setUsername("");
          expect(authEntity.username, equals(null));
        },
      );
    },
  );
  group(
    "SetPassword Function should",
    () {
      test(
        "assign the given value to password property",
        () {
          authEntity.setPassword("userPassword");
          expect(authEntity.password, equals("userPassword"));
        },
      );
      test(
        "assign no value to password property",
        () {
          authEntity.setPassword("");
          expect(authEntity.username, equals(null));
        },
      );
    },
  );
}

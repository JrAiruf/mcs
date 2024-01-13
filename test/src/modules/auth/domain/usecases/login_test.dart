import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mcs/src/imports.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../mocks/auth_mocks/auth_mocks_classes.dart';
import '../../../../../mocks/auth_mocks/auth_mocks_data.dart';

void main() {
  late IAuthRepository repository;
  late Login login;
  setUp(
    () {
      repository = AuthRepositoryMock();
      login = Login(repository);
    },
  );
  group(
    'Login usecase should',
    () {
      test(
        'return an AuthEntity object containg username and password',
        () async {
          when(() => repository.authenticate(any())).thenAnswer(
            (_) async => Right(AuthMockData.authEntity),
          );
          final user = AuthEntity("username", "password");
          final result = await login(user);
          expect(result.isRight(), equals(true));
          expect(result.fold((l) => null, (r) => r), isA<AuthEntity>());
          expect(result.fold((l) => null, (r) => r.username) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.password) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.username), equals("username"));
          expect(result.fold((l) => null, (r) => r.password), equals("password"));
        },
      );
      test('throw an AuthException', () async {
        when(() => repository.authenticate(any())).thenAnswer(
          (_) async => Left(AuthException("Usuário não encontrado")),
        );
        final user = AuthEntity("username", "password");
        final result = await login(user);
        expect(result.isLeft(), equals(true));
        expect(result.fold((l) => l, (r) => null), isA<AuthException>());
      });
    },
  );
}

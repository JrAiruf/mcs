import 'package:mcs/src/app_imports.dart';
import '../../../../../mocks/auth_mocks/auth_mock_classes.dart';
import '../../../../../mocks/auth_mocks/auth_mock_data.dart';

void main() {
  late IAuthDatasource datasource;
  late AuthRepository repository;
  setUp(
    () {
      datasource = AuthDatasourceMock();
      repository = AuthRepository(datasource);
    },
  );
  group(
    'Login function should',
    () {
      test(
        'convert data coming from datasource and return an instance of AuthEntity',
        () async {
          when(() => datasource.authenticate(any())).thenAnswer(
            (_) async => AuthMockData.authMap,
          );
          final result = await repository.authenticate(AuthMockData.authEntity);
          expect(result.fold((l) => null, (r) => r), isA<AuthEntity>());
          expect(result.fold((l) => null, (r) => r.username) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.password) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.username), equals("app"));
          expect(result.fold((l) => null, (r) => r.password), equals("2nq25nf7"));
        },
      );
      test(
        'return AuthException',
        () async {
          when(() => datasource.authenticate(any())).thenThrow(AuthException("Usuário não encontrado"));
          final user = AuthEntity(username: "username", password: "password");
          final result = await repository.authenticate(user);
          expect(result.fold((l) => l, (r) => null), isA<AuthException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Usuário não encontrado"));
        },
      );
    },
  );
  group(
    'SignOut function should',
    () {
      test(
        'call datasource to signout the application',
        () async {
          when(() => datasource.signOut()).thenAnswer((_) async => true);
          final result = await repository.signOut();
          expect(result.fold((l) => null, (r) => r), isA<bool>());
          expect(result.fold((l) => null, (r) => r), equals(true));
        },
      );
      test(
        'return AuthException due fail to signout',
        () async {
          when(() => datasource.signOut()).thenThrow(AuthException("Algum erro ocorreu"));
          final result = await repository.signOut();
          expect(result.fold((l) => l, (r) => null), isA<AuthException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Algum erro ocorreu"));
        },
      );
    },
  );
}

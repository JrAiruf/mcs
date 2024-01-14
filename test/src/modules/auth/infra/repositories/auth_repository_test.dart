import 'package:mcs/src/imports.dart';
import '../../../../../mocks/auth_mocks/auth_mock_classes.dart';
import '../../../../../mocks/auth_mocks/auth_mock_data.dart';

void main() {
  late ISSHAuthDatasource datasource;
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
}

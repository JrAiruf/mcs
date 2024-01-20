import 'package:mcs/src/app_imports.dart';
import '../../../../../lib/src/shared/mocks/auth_mocks/auth_mock_classes.dart';
import '../../../../../lib/src/shared/mocks/auth_mocks/auth_mock_data.dart';

void main() {
  late ISSHClientService service;
  late SSHAuthDatasource datasource;
  setUp(
    () {
      service = SSHClientServiceMock();
      datasource = SSHAuthDatasource(service);
    },
  );
  group(
    'Authenticate function should',
    () {
      test(
        'call ssh service to save user data in server and return a map containing username and password',
        () async {
          when(() => service.authenticate(any())).thenAnswer(
            (_) async => jsonEncode(AuthMockData.authMap),
          );

          final result = await datasource.authenticate(
            {"username": "username", "password": "password"},
          );
          expect(result, isA<Map<String, dynamic>>());
          expect(result["username"], equals("app"));
          expect(result["password"], equals("2nq25nf7"));
        },
      );
      test(
        'throw an AuthException due to unexisting user',
        () async {
          when(() => service.authenticate(any())).thenThrow(AuthException("Não foi possível realizar o login"));
          expect(
              () async => await datasource.authenticate(
                    {"username": "username", "password": "password"},
                  ),
              throwsA(isA<AuthException>()));
        },
      );
    },
  );
  group(
    'SignOut function should',
    () {
      test(
        'call ssh service to erase user data in server, to ocasionate the signout of the application',
        () async {
          when(() => service.signOut()).thenAnswer((_) async => true);

          final result = await datasource.signOut();
          expect(result, isA<bool>());
          expect(result, equals(true));
        },
      );
      test(
        'throw an AuthException due to unexisting user',
        () async {
          when(() => service.signOut()).thenThrow(AuthException("Algum erro ocorreu."));
          expect(() async => await datasource.signOut(), throwsA(isA<AuthException>()));
        },
      );
    },
  );
}

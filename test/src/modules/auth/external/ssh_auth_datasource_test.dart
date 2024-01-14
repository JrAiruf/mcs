import 'package:flutter_test/flutter_test.dart';
import 'package:mcs/src/imports.dart';
import 'package:mcs/src/modules/auth/external/ssh_auth_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/auth_mocks/auth_mock_classes.dart';
import '../../../../mocks/auth_mocks/auth_mock_data.dart';

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
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mcs/src/imports.dart';
import 'package:mcs/src/services/ssh_client_service.dart';

void main() {
  late ISSHClientService clientService;
  setUp(
    () async {
      clientService = SSHClientService();
    },
  );
  group(
    "Authenticate function should",
    () {
      test(
        "access SSH server and authenticate with username and password, and return data corresponding to the user authenticated",
        () async {
          final authMap = {
            "username": "app",
            "password": "2nq25nf7",
          };
          final result = await clientService.authenticate(authMap);
          expect(result, isA<String>());
        },
      );
      test(
        "thrown an AuthException due unexisting user",
        () async {
          final authMap = {
            "username": "app",
            "password": "2nq25n17",
          };
          expect(() async => await clientService.authenticate(authMap), throwsA(isA<AuthException>()));
        },
      );
    },
  );
}

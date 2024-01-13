import 'package:flutter_test/flutter_test.dart';
import 'package:mcs/src/imports.dart';
import 'package:mcs/src/modules/auth/external/ssh_auth_datasource.dart';
import 'package:mcs/src/services/ssh_client_service.dart';

void main() {
  late ISSHClientService clientService;
  late ISSHAuthDatasource datasource;
  setUp(
    () async {
      clientService = SSHClientService();
      datasource = SSHAuthDatasource(clientService);
    },
  );
  test(
    "Testing SSHClient return",
    () async {
      final authMap = {
        "username": "app",
        "password": "2nq25nf7",
      };
      final result = await datasource.authenticate(authMap);
      print(result);
    },
  );
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mcs/src/imports.dart';
import 'package:mcs/src/modules/auth/external/ssh_client_datasource.dart';
import 'package:mcs/src/services/ssh_client_service.dart';

void main() {
  late ISSHClientService clientService;
  late ISSHDatasource datasource;
  setUp(
    () async {
      clientService = SSHClientService();
      datasource = SSHDatasource(clientService);
    },
  );
  test(
    "Testing SSHClient return",
    () async {
      final result =
          await datasource.authenticate(AuthEntity("app", "2nq25nf7"));
      print(result);
    },
  );
}

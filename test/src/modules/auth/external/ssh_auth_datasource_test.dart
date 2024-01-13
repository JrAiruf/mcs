import 'package:flutter_test/flutter_test.dart';
import 'package:mcs/src/services/ssh_client_service.dart';

void main() {
  group(
    'Authenticate function should',
    () {
      test(
        'save user data in server and return a map containing username and password',
        () async {
          final service = SSHClientService();
          final result = await service.authenticate(
            {
              "username": "app",
              "password": "2nq25nf7",
            },
          );
          print(result);
        },
      );
      test(
        'Authenticate function should',
        () {},
      );
    },
  );
}

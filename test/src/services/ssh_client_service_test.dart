import 'package:mcs/src/app_imports.dart';

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
  group(
    "SaveScript function should",
    () {
      test(
        "save a single script in SSH server and return data corresponding to the script saved",
        () async {
          final authMap = {
            "username": "app",
            "password": "2nq25nf7",
          };
          final authResult = await clientService.authenticate(authMap);
          expect(authResult, isA<String>());
          final scriptMap = {"name": "NORTH TEST", "command": "NORTH_TESTE_SCRIPT", "description": ""};
          final result = await clientService.saveScript(scriptMap);
          final resultMap = jsonDecode(result);
          expect(result, isA<String>());
          expect(resultMap["name"], equals("NORTH TEST"));
          expect(resultMap["command"], equals("NORTH_TESTE_SCRIPT"));
        },
      );
      test(
        "thrown an ScriptException due any error",
        () async {
          final scriptMap = {"name": "NORTH TEST", "command": "NORTH_TESTE_SCRIPT", "description": ""};
          expect(() async => await clientService.saveScript(scriptMap), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
}

import 'package:mcs/src/app_imports.dart';

import '../../mocks/auth_mocks/auth_mock_data.dart';

void main() {
  late SSHClientService clientService;
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
          final result = await clientService.authenticate(AuthMockData.authMap);
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
          final authResult = await clientService.authenticate(AuthMockData.authMap);
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
  group(
    "FetchScriptsList function should",
    () {
      test(
        "retrieve a string list of json, containing all scripts created on server",
        () async {
          await clientService.authenticate(AuthMockData.authMap);
          final jsonResult = await clientService.fetchScriptsList();
          final scriptMapList = jsonDecode(jsonResult);
          final singleMap = scriptMapList.first;
          expect(scriptMapList, isA<List>());
          expect(scriptMapList.isNotEmpty, equals(true));
          expect(singleMap, isA<Map<String, dynamic>>());
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
  test(
    "SignOut function should erase auth data saved on server",
    () async {
      final result = await clientService.authenticate(AuthMockData.authMap);
      expect(result, isA<String>());
      final authResult = await clientService.signOut();
      expect(authResult, isA<bool>());
      expect(authResult, equals(true));
    },
  );
  test(
    "NullScriptsList function should return false if an list of scripts exists in server.",
    () async {
      await clientService.authenticate(AuthMockData.authMap);
      final verification = await clientService.nullScriptsList();
      expect(verification, equals(false));
    },
  );
}

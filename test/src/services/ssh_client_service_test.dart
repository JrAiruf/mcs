import 'package:mcs/src/app_imports.dart';

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
          final result = await clientService.saveScript(ScriptMockData.creationScriptMap);
          final resultMap = jsonDecode(result);
          expect(result, isA<String>());
          expect(resultMap["name"], equals("Ativar North"));
          expect(resultMap["command"], equals("NORTH_ATIVA"));
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
  group(
    "UpdateScript function should",
    () {
      test(
        "access SSH server and modify the given script, and return it's data",
        () async {
          final result = await clientService.authenticate(AuthMockData.authMap);
          expect(result, isA<String>());
          final creationResult = await clientService.saveScript(ScriptMockData.creationScriptMap);
          final creationMap = jsonDecode(creationResult);
          final currentList = await clientService.fetchScriptsList();
          int listAmount = currentList.length;
          creationMap["description"] = "Script with description";
          final updateResult = await clientService.updateScript(creationMap);
          final resultMap = jsonDecode(updateResult);
          expect(updateResult, isA<String>());
          expect(resultMap["name"], equals("Ativar North"));
          expect(resultMap["command"], equals("NORTH_ATIVA"));
          expect(resultMap["description"], equals("Script with description"));
          expect(listAmount == currentList.length, equals(true));
        },
      );
      test(
        "thrown an ScriptException due wrong format",
        () async {
          await clientService.authenticate(AuthMockData.authMap);
          await clientService.saveScript(ScriptMockData.scriptMap);
          expect(() async => await clientService.updateScript(ScriptMockData.wrongScriptMap), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
  group(
    "RemoveScript function should",
    () {
      test(
        "access SSH server and remove the given script",
        () async {
          final result = await clientService.authenticate(AuthMockData.authMap);
          expect(result, isA<String>());
          final createdScript = await clientService.saveScript(ScriptMockData.scriptMap);
          final mapScript = jsonDecode(createdScript);
          final removeResult = await clientService.removeScript(jsonDecode(createdScript));
          expect(removeResult, isA<String>());
          expect(removeResult, equals("Script removido: ${mapScript["id"]}"));
        },
      );
      test(
        "thrown an ScriptException due wrong format",
        () async {
          await clientService.authenticate(AuthMockData.authMap);
          expect(() async => await clientService.removeScript(null), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
}

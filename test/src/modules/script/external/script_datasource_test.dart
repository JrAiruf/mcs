import 'package:mcs/src/app_imports.dart';

void main() {
  late ISSHClientService service;
  late ScriptDatasource datasource;
  setUp(
    () async {
      service = SSHClientServiceMock();
      datasource = ScriptDatasource(service);
    },
  );
  group(
    "SaveScript function should",
    () {
      test(
        "save the given script in ssh server",
        () async {
          when(() => service.saveScript(any())).thenAnswer((_) async => ScriptMockData.scriptJsonMap);
          final result = await datasource.saveScript({"name": "Outro Script", "command": "OUTRO_COMANDO"});
          expect(result, isA<Map<String, dynamic>>());
          expect(result["name"], equals("Ativar North"));
          expect(result["command"], equals("NORTH_ATIVA"));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => service.saveScript(any())).thenThrow(ScriptException("Não foi possível criar um novo script."));
          expect(() async => await datasource.saveScript({}), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
  group(
    "ExecuteScript function should",
    () {
      test(
        "call ssh service to execute the given script in ssh server",
        () async {
          when(() => service.executeScript(any())).thenAnswer((_) async => ScriptMockData.scriptJsonMap);
          final result = await datasource.executeScript({"name": "Outro Script", "command": "OUTRO_COMANDO", "description": "Script's description"});
          expect(result, isA<Map<String, dynamic>>());
          expect(result["id"], equals("7f2cd6c0-b855-11ee-bc9e-93b2374d10ad"));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => service.executeScript(any())).thenThrow(ScriptException("Não foi possível executar o script."));
          expect(() async => await datasource.executeScript({}), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
  group(
    "FetchScriptsList function should",
    () {
      test(
        "return a List containing all scripts maps",
        () async {
          final scriptsJsonList = jsonEncode(ScriptMockData.scriptsMapsList.map((script) => jsonEncode(script)).toList());
          when(() => service.fetchScriptsList()).thenAnswer((_) async => scriptsJsonList);
          final result = await datasource.fetchScriptsList();
          expect(result, isA<List>());
          expect(result.isNotEmpty, equals(true));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => service.fetchScriptsList()).thenThrow(ScriptsListException("Não foi possível obter os scripts."));
          expect(() async => await datasource.fetchScriptsList(), throwsA(isA<ScriptsListException>()));
        },
      );
    },
  );
  group(
    "UpdateScript function should",
    () {
      test(
        "update the given script",
        () async {
          when(() => service.updateScript(any())).thenAnswer((_) async => ScriptMockData.modifiedScriptJsonMap);
          final result = await datasource.updateScript({"name": "Outro Script", "command": "OUTRO_COMANDO"});
          expect(result, isA<Map<String, dynamic>>());
          expect(result["name"], equals("Ativar North"));
          expect(result["command"], equals("NORTH_ATIVA"));
          expect(result["description"], equals("Script with description"));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => service.updateScript(any())).thenThrow(ScriptException("Não foi possível atualizar o script."));
          expect(() async => await datasource.updateScript({}), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
  group(
    "RemoveScript function should",
    () {
      test(
        "Remove the given script",
        () async {
          when(() => service.removeScript(any())).thenAnswer((_) async => "Script removido.");
          final result = await datasource.removeScript({"name": "Outro Script", "command": "OUTRO_COMANDO"});
          expect(result, isA<String>());
          expect(result, equals("Script removido."));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => service.removeScript(any())).thenThrow(ScriptException("Não foi possível remover o script."));
          expect(() async => await datasource.removeScript({}), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
}

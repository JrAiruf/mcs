import 'package:mcs/src/app_imports.dart';

import '../../../../mocks/script_mocks/script_mock_classes.dart';
import '../../../../mocks/script_mocks/script_mock_data.dart';

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
        "save the given script in shared preferences",
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
}

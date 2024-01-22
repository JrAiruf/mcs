import 'package:mcs/src/app_imports.dart';

void main() {
  late IScriptDatasource datasource;
  late ScriptRepository repository;
  setUp(
    () {
      datasource = ScriptDatasourceMock();
      repository = ScriptRepository(datasource);
    },
  );
  group(
    "SaveScript Function should",
    () {
      test(
        "call datasource to save the current script localy",
        () async {
          when(() => datasource.saveScript(any())).thenAnswer((_) async => ScriptMockData.scriptMap);
          final result = await repository.saveScript(ScriptMockData.entity);

          expect(result.fold((l) => null, (r) => r), isA<Script>());
          expect(result.fold((l) => null, (r) => r.name) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.command) != null, equals(true));
        },
      );
      test(
        "throw an ScriptException ",
        () async {
          when(() => datasource.saveScript(any())).thenThrow(ScriptException("Não foi possível cadastrar um novo script."));
          final result = await repository.saveScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => l, (r) => r), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível cadastrar um novo script."));
        },
      );
    },
  );
  group(
    'ExecuteScript function should',
    () {
      test(
        'call datasource to execute the current script',
        () async {
          when(() => datasource.executeScript(any())).thenAnswer((_) async => true);
          final result = await repository.executeScript(ScriptMockData.entity);
          expect(result.fold((l) => null, (r) => r), isA<bool>());
          expect(result.fold((l) => null, (r) => r), equals(true));
        },
      );
      test(
        'return ScriptException',
        () async {
          when(() => datasource.executeScript(any())).thenThrow(ScriptException("Erro em executar script."));
          final result = await repository.executeScript(ScriptMockData.entity);
          expect(result.fold((l) => l, (r) => null), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Erro em executar script."));
        },
      );
    },
  );
  group(
    "FetchScriptsList function should",
    () {
      test(
        "return a List containing all scripts",
        () async {
          when(() => datasource.fetchScriptsList()).thenAnswer((_) async => ScriptMockData.scriptsMapsList);

          final result = await repository.fetchScriptsList();
          expect(result.fold((l) => null, (r) => r), isA<List<Script>>());
          expect(result.fold((l) => null, (r) => r.isNotEmpty), equals(true));
        },
      );
      test(
        "throw an ScriptsListException",
        () async {
          when(() => datasource.fetchScriptsList()).thenThrow(ScriptsListException("Não foi possível obter os scripts."));
          final result = await repository.fetchScriptsList();
          expect(result.fold((l) => l, (r) => null), isA<ScriptsListException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível obter os scripts."));
        },
      );
    },
  );
  group(
    "UpdateScript function should",
    () {
      test(
        "return a script map modified",
        () async {
          when(() => datasource.updateScript(any())).thenAnswer((_) async => ScriptMockData.modifiedScriptMap);

          final result = await repository.updateScript(ScriptMockData.entity);
          expect(result.fold((l) => null, (r) => r), isA<Script>());
          expect(result.fold((l) => null, (r) => r.name) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.command) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.description) != null, equals(true));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => datasource.updateScript(any())).thenThrow(ScriptException("Não foi possível atualizar o script."));
          final result = await repository.updateScript(ScriptMockData.entity);
          expect(result.fold((l) => l, (r) => null), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível atualizar o script."));
        },
      );
    },
  );
  group(
    "RemoveScript function should",
    () {
      test(
        "remove a script through datasource function",
        () async {
          when(() => datasource.removeScript(any())).thenAnswer((_) async => "Script removido.");

          final result = await repository.removeScript(ScriptMockData.entity);
          expect(result.fold((l) => null, (r) => r), isA<String>());
          expect(result.fold((l) => null, (r) => r), equals("Script removido."));
        },
      );
      test(
        "throw an ScriptsListException",
        () async {
          when(() => datasource.removeScript(any())).thenThrow(ScriptException("Não foi possível remover o script."));
          final result = await repository.removeScript(ScriptMockData.entity);
          expect(result.fold((l) => l, (r) => null), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível remover o script."));
        },
      );
    },
  );
}

import 'package:mcs/src/app_imports.dart';

void main() {
  late IScriptRepository repository;
  late ExecuteScript executeScript;
  setUp(
    () {
      repository = ScriptRepositoryMock();
      executeScript = ExecuteScript(repository);
    },
  );
  group(
    "ExecuteScript Script Should",
    () {
      test(
        "execute the selected script in server",
        () async {
          when(() => repository.executeScript(any())).thenAnswer((_) async => Right(ScriptMockData.entity));
          final result = await executeScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => null, (r) => r), isA<Script>());
          expect(result.fold((l) => null, (r) => r.name) != null, equals(true));
          expect(result.fold((l) => null, (r) => r.command) != null, equals(true));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => repository.executeScript(any())).thenAnswer((_) async => Left(ScriptException("Não foi possível executar o script.")));
          final result = await executeScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => l, (r) => null), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível executar o script."));
        },
      );
    },
  );
}

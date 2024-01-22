import 'package:mcs/src/app_imports.dart';
import 'package:mcs/src/modules/script/domain/usecases/execute_script.dart';

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
          when(() => repository.executeScript(any())).thenAnswer((_) async => const Right(true));
          final result = await executeScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => null, (r) => r), isA<bool>());
          expect(result.fold((l) => null, (r) => r), equals(true));
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

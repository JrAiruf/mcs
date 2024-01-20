import 'package:mcs/src/app_imports.dart';

void main() {
  late IScriptRepository repository;
  late RemoveScript removeScript;
  setUp(
    () {
      repository = ScriptRepositoryMock();
      removeScript = RemoveScript(repository);
    },
  );
  group(
    "Remove Script Should",
    () {
      test(
        "remove selected script from list",
        () async {
          when(() => repository.removeScript(any())).thenAnswer(
            (_) async => const Right("Script removido."),
          );
          final result = await removeScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => null, (r) => r), isA<String>());
          expect(result.fold((l) => null, (r) => r), equals("Script removido."));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          when(() => repository.removeScript(any())).thenAnswer((_) async => Left(ScriptException("Não foi possível remover o script.")));
          final result = await removeScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => l, (r) => null), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível remover o script."));
        },
      );
    },
  );
}

import 'package:mcs/src/app_imports.dart';

void main() {
  late IScriptRepository repository;
  late UpdateScript updateScript;
  setUp(
    () {
      repository = ScriptRepositoryMock();
      updateScript = UpdateScript(repository);
    },
  );
  group(
    "UpdateScript should",
    () {
      test(
        "return a new script modified",
        () async {
          when(() => repository.updateScript(any())).thenAnswer((_) async => Right(ScriptMockData.modifiedEntity));
          final updateResult = await updateScript(ScriptMockData.entity);
          expect(updateResult.fold((l) => null, (r) => r), isA<Script>());
          expect(updateResult.fold((l) => null, (r) => r.description), equals("Script with description"));
        },
      );
      test(
        "emit an ScriptException",
        () async {
          when(() => repository.updateScript(any())).thenAnswer((_) async => Left(ScriptException("Não foi possível atualizar o script")));
          final updateResult = await updateScript(ScriptMockData.entity);
          expect(updateResult.fold((l) => l, (r) => null), isA<ScriptException>());
          expect(updateResult.fold((l) => l.message, (r) => null), equals("Não foi possível atualizar o script"));
        },
      );
    },
  );
}

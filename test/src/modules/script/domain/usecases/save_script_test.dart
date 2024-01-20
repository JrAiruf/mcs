import 'package:mcs/src/app_imports.dart';

import '../../../../../../lib/src/shared/mocks/script_mocks/script_mock_classes.dart';
import '../../../../../../lib/src/shared/mocks/script_mocks/script_mock_data.dart';

void main() {
  late IScriptRepository repository;
  late SaveScript saveScript;
  setUp(
    () {
      repository = ScriptRepositoryMock();
      saveScript = SaveScript(repository);
    },
  );
  group(
    "Save Script should",
    () {
      test(
        "save a script with the given name and value for command",
        () async {
          when(() => repository.saveScript(any())).thenAnswer(
            (_) async => Right(ScriptMockData.entity),
          );
          final result = await saveScript(
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
          when(() => repository.saveScript(any())).thenAnswer(
            (_) async => Left(ScriptException("Não foi possível cadastrar um novo script.")),
          );
          final result = await saveScript(
            Script(name: "Ativar North", command: "NORTH_ATIVA", description: "descrição do script"),
          );
          expect(result.fold((l) => l, (r) => r), isA<ScriptException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível cadastrar um novo script."));
        },
      );
    },
  );
}

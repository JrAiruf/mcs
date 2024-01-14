import 'package:mcs/src/app_imports.dart';

import '../../../../../mocks/script_mocks/script_mock_classes.dart';
import '../../../../../mocks/script_mocks/script_mock_data.dart';

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
          final result = await repository.saveScript(ScriptMockData.scriptEntity);

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
}

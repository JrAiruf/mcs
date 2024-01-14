import 'package:mcs/src/app_imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ScriptDatasource datasource;
  setUp(
    () {
      datasource = ScriptDatasource();
    },
  );
  tearDown(
    () {
      datasource = ScriptDatasource();
    },
  );
  group(
    "SaveScript function should",
    () {
      test(
        "save the given script in shared preferences",
        () async {
          final result = await datasource.saveScript({"name": "Outro Script", "command": "OUTRO_COMANDO"});
          expect(result, isA<Map<String, dynamic>>());
          expect(result["name"], equals("Outro Script"));
        },
      );
      test(
        "throw an ScriptException",
        () async {
          expect(() async => await datasource.saveScript({}), throwsA(isA<ScriptException>()));
        },
      );
    },
  );
}

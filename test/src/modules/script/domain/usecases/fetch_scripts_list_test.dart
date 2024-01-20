import 'package:mcs/src/app_imports.dart';

void main() {
  late IScriptRepository repository;
  late FetchScriptsList fetchScriptsList;
  setUp(
    () {
      repository = ScriptRepositoryMock();
      fetchScriptsList = FetchScriptsList(repository);
    },
  );
  group(
    "FetchScriptsList should",
    () {
      test(
        'return a List<Scripts>',
        () async {
          when(() => repository.fetchScriptsList()).thenAnswer((_) async => right(ScriptMockData.scriptsList));
          final result = await fetchScriptsList();
          expect(result.fold((l) => null, (r) => r), isA<List<Script>>());
          expect(result.fold((l) => null, (r) => r.isNotEmpty), equals(true));
        },
      );
      test(
        'throw an ScriptsListException',
        () async {
          when(() => repository.fetchScriptsList()).thenAnswer((_) async => left(ScriptsListException("Não foi possível obter os scripts.")));
          final result = await fetchScriptsList();
          expect(result.fold((l) => l, (r) => null), isA<ScriptsListException>());
          expect(result.fold((l) => l.message, (r) => null), equals("Não foi possível obter os scripts."));
        },
      );
    },
  );
}

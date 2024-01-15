import 'package:mcs/src/app_imports.dart';

final class ScriptRepository implements IScriptRepository {
  ScriptRepository(IScriptDatasource datasource) : _datasource = datasource;
  final IScriptDatasource _datasource;
  @override
  Future<Either<ScriptException, Script>> saveScript(Script? script) async {
    try {
      final result = await _datasource.saveScript(ScriptAdapter.toMap(script!));
      final scriptData = ScriptAdapter.fromMap(result);
      return right(scriptData);
    } on BaseException catch (e) {
      return left(ScriptException(e.message));
    }
  }

  @override
  Future<Either<ScriptsListException, List<Script>>> fetchScriptsList() async {
    try {
      final result = await _datasource.fetchScriptsList() as List<Map<String, dynamic>>;
      final scriptsList = result.map((script) => ScriptAdapter.fromMap(script)).toList();
      return right(scriptsList);
    } on BaseException catch (e) {
      return left(ScriptsListException(e.message));
    }
  }
}

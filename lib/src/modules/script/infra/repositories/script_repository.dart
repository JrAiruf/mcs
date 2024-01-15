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
  Future<Either<ScriptException, List<Script>>> fetchScriptsList() {
    // TODO: implement fetchScriptsList
    throw UnimplementedError();
  }
}

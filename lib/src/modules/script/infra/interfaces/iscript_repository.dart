import 'package:mcs/src/app_imports.dart';

abstract interface class IScriptRepository {
  Future<Either<ScriptException, Script>> saveScript(Script? script);
  Future<Either<ScriptException, bool>> executeScript(Script? script);
  Future<Either<ScriptsListException, List<Script>>> fetchScriptsList();
  Future<Either<ScriptException, Script>> updateScript(Script? script);
  Future<Either<ScriptException, String>> removeScript(Script? script);

}

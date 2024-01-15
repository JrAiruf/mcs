import 'package:mcs/src/app_imports.dart';

abstract interface class IScriptRepository {
  Future<Either<ScriptException, Script>> saveScript(Script? script);
  Future<Either<ScriptsListException, List<Script>>> fetchScriptsList();
}

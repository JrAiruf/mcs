import 'package:mcs/src/imports.dart';

abstract interface class IScriptRepository {
  Future<Either<ScriptException, Script>> saveScript(Script? script);
}

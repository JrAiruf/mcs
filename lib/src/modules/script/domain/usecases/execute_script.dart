import 'package:mcs/src/app_imports.dart';

final class ExecuteScript {
  ExecuteScript(IScriptRepository repository) : _repository = repository;

  final IScriptRepository _repository;

  Future<Either<ScriptException, bool>> call(Script script) async => await _repository.executeScript(script);
}

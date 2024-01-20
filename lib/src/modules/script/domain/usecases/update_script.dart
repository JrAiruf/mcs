import 'package:mcs/src/app_imports.dart';

final class UpdateScript {
  UpdateScript(IScriptRepository repository) : _repository = repository;
  final IScriptRepository _repository;
  Future<Either<ScriptException, Script>> call(Script script) async => await _repository.updateScript(script);
}

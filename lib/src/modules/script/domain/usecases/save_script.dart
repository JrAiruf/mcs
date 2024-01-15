import 'package:mcs/src/app_imports.dart';

final class SaveScript {
  SaveScript(IScriptRepository repository) : _repository = repository;
  final IScriptRepository _repository;
  Future<Either<ScriptException, Script>> call(Script script) async => await _repository.saveScript(script);
}

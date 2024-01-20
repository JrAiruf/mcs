import 'package:mcs/src/app_imports.dart';

final class RemoveScript {
  RemoveScript(IScriptRepository repository) : _repository = repository;
  final IScriptRepository _repository;
  Future<Either<ScriptException, String>> call(Script script) async => await _repository.removeScript(script);
}

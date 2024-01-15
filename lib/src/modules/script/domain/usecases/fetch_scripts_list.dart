import 'package:mcs/src/app_imports.dart';

final class FetchScriptsList {
  FetchScriptsList(IScriptRepository repository) : _repository = repository;
  final IScriptRepository _repository;
  Future<Either<ScriptException, List<Script>>> call() async {
    throw UnimplementedError();
  }
}

import 'package:mcs/src/app_imports.dart';

final class FetchScriptsList {
  FetchScriptsList(IScriptRepository repository) : _repository = repository;
  final IScriptRepository _repository;
  Future<Either<ScriptsListException, List<Script>>> call() async => await _repository.fetchScriptsList();
}

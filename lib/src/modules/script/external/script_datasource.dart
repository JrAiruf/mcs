import 'package:mcs/src/app_imports.dart';

final class ScriptDatasource implements IScriptDatasource {
  ScriptDatasource(ISSHClientService service) : _service = service;
  List<String> scripts = [];

  final ISSHClientService _service;
  @override
  Future<Map<String, dynamic>> saveScript(Map<String, dynamic>? script) async {
    try {
      final newScript = jsonDecode(await _service.saveScript(script)) as Map<String, dynamic>;
      return newScript;
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<List> fetchScriptsList() async {
    try {
      final scriptsList = jsonDecode(await _service.fetchScriptsList()) as List;
      return scriptsList;
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateScript(Map<String, dynamic>? script) async {
    try {
      final newScript = jsonDecode(await _service.updateScript(script)) as Map<String, dynamic>;
      return newScript;
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<bool> removeScript(Map<String, dynamic>? script) {
    // TODO: implement removeScript
    throw UnimplementedError();
  }
}

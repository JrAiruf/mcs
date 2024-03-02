import 'package:mcs/src/app_imports.dart';

final class ScriptDatasource implements IScriptDatasource {
  ScriptDatasource(ISSHClientService service) : _service = service;

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
  Future<Map<String, dynamic>> executeScript(Map<String, dynamic>? script) async {
    try {
      final scriptExecutionJson = await _service.executeScript(script);
      return jsonDecode(scriptExecutionJson) as Map<String, dynamic>;
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
      final updatedScript = jsonDecode(await _service.updateScript(script)) as Map<String, dynamic>;
      return updatedScript;
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<String> removeScript(Map<String, dynamic>? script) async {
    try {
      return await _service.removeScript(script);
    } on BaseException {
      rethrow;
    }
  }
}

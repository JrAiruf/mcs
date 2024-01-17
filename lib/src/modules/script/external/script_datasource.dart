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
    if (scripts.isNotEmpty) {
      final scriptsList = scripts.map((script) => jsonDecode(script)).toList();
      return scriptsList;
    } else {
      throw ScriptsListException("Não foi possível obter os scripts.");
    }
  }
}

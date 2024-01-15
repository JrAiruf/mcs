import 'package:mcs/src/app_imports.dart';

final class ScriptDatasource implements IScriptDatasource {
  ScriptDatasource({SharedPreferences? sharedPreferences}) {
    if (sharedPreferences != null) {
      _sharedPreferences = sharedPreferences;
    } else {
      SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
    }
  }
  SharedPreferences? _sharedPreferences;
  List<String> scripts = [];
  @override
  Future<Map<String, dynamic>> saveScript(Map<String, dynamic>? script) async {
    await _sharedPreferences?.setStringList("scripts", scripts);
    if (script != null && script.isNotEmpty) {
      final jsonScript = jsonEncode(script);
      scripts.insert(0, jsonScript);
      final savedScript = jsonDecode(scripts.first) as Map<String, dynamic>;
      return savedScript;
    } else {
      throw ScriptException("Não foi possível salvar um novo script.");
    }
  }

  @override
  Future<List> fetchScriptsList() async {
    {
      if (scripts.isNotEmpty) {
        final scriptsList = scripts.map((script) => jsonDecode(script)).toList();
        return scriptsList;
      } else {
        throw ScriptsListException("Não foi possível obter os scripts.");
      }
    }
  }
}

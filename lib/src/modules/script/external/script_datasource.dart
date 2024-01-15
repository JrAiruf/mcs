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
  @override
  Future<Map<String, dynamic>> saveScript(Map<String, dynamic>? script) async {
    if (script != null && script.isNotEmpty) {
      final sharedList = _sharedPreferences?.getStringList("scripts") ?? [];
      final jsonScript = jsonEncode(script);
      sharedList.insert(0, jsonScript);
      _sharedPreferences?.setStringList("scripts", sharedList);
      final savedScript = jsonDecode(sharedList.first) as Map<String, dynamic>;
      return savedScript;
    } else {
      throw ScriptException("Não foi possível salvar um novo script.");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchScriptsList() async {
    final scriptsJsonList = _sharedPreferences?.getStringList("scripts");
    if (scriptsJsonList != null) {
      final scriptsList = scriptsJsonList.map((script) => jsonDecode(script)).toList() as List<Map<String, dynamic>>;
      return scriptsList;
    } else {
      throw ScriptException("Não foi possível obter os scripts.");
    }
  }
}

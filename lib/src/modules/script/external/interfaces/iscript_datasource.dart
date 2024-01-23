abstract interface class IScriptDatasource {
  Future<Map<String, dynamic>> saveScript(Map<String, dynamic>? script);
  Future<Map<String,dynamic>> executeScript(Map<String, dynamic>? script);
  Future<List> fetchScriptsList();
  Future<Map<String, dynamic>> updateScript(Map<String, dynamic>? script);
  Future<String> removeScript(Map<String, dynamic>? script);
}


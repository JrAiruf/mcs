abstract interface class IScriptDatasource {
  Future<Map<String, dynamic>> saveScript(Map<String, dynamic>? script);
  Future<List> fetchScriptsList();
  Future<Map<String, dynamic>> updateScript(Map<String, dynamic>? script);
  Future<bool> removeScript(Map<String, dynamic>? script);
}


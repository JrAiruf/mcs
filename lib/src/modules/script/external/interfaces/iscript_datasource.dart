abstract interface class IScriptDatasource {
  Future<Map<String, dynamic>> saveScript(Map<String, dynamic>? script);
  Future<List> fetchScriptsList();
}

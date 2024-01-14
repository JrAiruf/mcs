abstract interface class ISSHAuthDatasource {
  Future<Map<String,dynamic>> authenticate(Map<String, dynamic>? authEntity);
}

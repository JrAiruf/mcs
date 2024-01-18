abstract interface class IAuthDatasource {
  Future<Map<String,dynamic>> authenticate(Map<String, dynamic>? authEntity);
}

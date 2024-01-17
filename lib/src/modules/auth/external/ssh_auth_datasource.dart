import '../auth_imports.dart';

final class SSHAuthDatasource implements ISSHAuthDatasource {
  SSHAuthDatasource(ISSHClientService service) : _service = service;

  final ISSHClientService _service;

  @override
  Future<Map<String, dynamic>> authenticate(Map<String, dynamic>? authEntity) async {
    try {
      final authData = jsonDecode(await _service.authenticate(authEntity!)) as Map<String, dynamic>;
      return authData;
    } on BaseException {
      rethrow;
    }
  }
}

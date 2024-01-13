import '../auth_imports.dart';

final class SSHAuthDatasource implements ISSHAuthDatasource {
  SSHAuthDatasource(ISSHClientService service) : _service = service;

  final ISSHClientService _service;
  @override
  Future<Map<String, dynamic>> authenticate(Map<String, dynamic>? authEntity) async {
    return await _service.authenticate(authEntity ?? {});
  }
}

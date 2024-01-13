import '../auth_imports.dart';

final class SSHDatasource implements ISSHDatasource {
  SSHDatasource(ISSHClientService service) : _service = service;

  final ISSHClientService _service;
  @override
  Future authenticate(AuthEntity authEntity) async {
    return await _service.authenticate(authEntity);
  }
}

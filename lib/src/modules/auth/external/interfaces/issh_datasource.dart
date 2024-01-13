import '../../auth_imports.dart';

abstract class ISSHDatasource {
  Future authenticate(AuthEntity authEntity);
}

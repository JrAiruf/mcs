import 'package:mcs/src/imports.dart';

abstract class ISSHClientService {
  Future authenticate(AuthEntity authEntity);
  Future runCommand(String command);
}

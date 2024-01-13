abstract class ISSHClientService {
  Future authenticate(Map<String, dynamic> authEntity);
  Future runCommand(String command);
}

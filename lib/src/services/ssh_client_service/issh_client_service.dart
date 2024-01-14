abstract class ISSHClientService {
  Future<String> authenticate(Map<String, dynamic>? authEntity);
  Future runCommand(String command);
}

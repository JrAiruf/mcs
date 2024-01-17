abstract class ISSHClientService {
  Future<String> authenticate(Map<String, dynamic>? authEntity);
  Future<String> saveScript(Map<String, dynamic>? script);
  Future runCommand(String command);
}

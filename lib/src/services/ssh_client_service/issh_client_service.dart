abstract class ISSHClientService {
  Future<String> authenticate(Map<String, dynamic>? authEntity);
  Future<bool> signOut();
  Future<String> saveScript(Map<String, dynamic>? script);
  Future<String> updateScript(Map<String, dynamic>? script);
  Future<String> removeScript(Map<String, dynamic>? script);
  Future<String> fetchScriptsList();
  Future<String> runCommand(String command);
}

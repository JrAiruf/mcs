import 'package:mcs/src/app_imports.dart';

class SSHClientService implements ISSHClientService {
  @override
  Future runCommand(String command) {
    throw UnimplementedError();
  }

  late SSHClient _client;
  final _authFile = "auth.txt";
  final _scriptsFile = "scripts.txt";

  @override
  Future<String> authenticate(Map<String, dynamic>? authMap) async {
    try {
      _client = SSHClient(
        await SSHSocket.connect(ipServer, 22),
        username: authMap?["username"],
        onPasswordRequest: () => authMap?["password"],
        keepAliveInterval: const Duration(minutes: 30),
      );
      final authFileContent = jsonEncode(authMap);
      await _client.execute("echo '$authFileContent' > $_authFile");
      await _client.execute("echo '[]' > $_scriptsFile");
      final data = await _client.execute("cat $_authFile");
      final jsonData = utf8.decode(await data.stdout.asBroadcastStream().first);
      return jsonData;
    } catch (e) {
      throw AuthException("Não foi possível realizar o login. ${e.toString()}");
    }
  }

  @override
  Future<String> saveScript(Map<String, dynamic>? script) async {
    try {
      final userData = await _client.execute("cat $_authFile");
      final jsonData = utf8.decode(await userData.stdout.first);
      if (jsonData.isNotEmpty) {
        final scriptsDataList = await _client.execute("cat $_scriptsFile");
        final scriptsJsonList = utf8.decode(await scriptsDataList.stdout.first);
        final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
        scriptsMapsList.insert(0, script);
        await _client.execute("echo '$scriptsMapsList' > $_scriptsFile");
        final scriptJsonMap = jsonEncode(scriptsMapsList.first);
        return scriptJsonMap;
      } else {
        throw AuthException("O usuário não está autenticado.");
      }
    } catch (e) {
      throw ScriptException("Não foi possível criar um novo script.");
    }
  }

  Future<String> returnDirectoryFiles(SSHClient client) async {
    final dir = await client.execute("pwd");
    return utf8.decode(await dir.stdout.first);
  }
}

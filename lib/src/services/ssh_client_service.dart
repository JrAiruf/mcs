import 'package:mcs/src/app_imports.dart';

class SSHClientService implements ISSHClientService {
  @override
  Future runCommand(String command) {
    throw UnimplementedError();
  }

  @override
  Future<String> authenticate(Map<String, dynamic>? authMap) async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(ipServer, 22),
        username: authMap?["username"],
        onPasswordRequest: () => authMap?["password"],
        keepAliveInterval: const Duration(minutes: 30),
      );
      const authFile = "auth.txt";
      final authFileContent = jsonEncode(authMap);
      await client.execute("echo '$authFileContent' > $authFile");
      final data = await client.execute("cat $authFile");
      final jsonData = utf8.decode(await data.stdout.first);
      return jsonData;
    } catch (e) {
      throw AuthException("Não foi possível realizar o login. ${e.toString()}");
    }
  }

  Future<String> returnDirectoryFiles(SSHClient client) async {
    final dir = await client.execute("pwd");
    return utf8.decode(await dir.stdout.first);
  }
}

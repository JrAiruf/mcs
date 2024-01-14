import 'dart:io';
import 'package:mcs/src/imports.dart';
class SSHClientService implements ISSHClientService {
  @override
  Future runCommand(String command) {
    throw UnimplementedError();
  }

  @override
  Future<String> authenticate(Map<String, dynamic>? authMap) async {
    try {
      final authData = jsonEncode(
        {
          "username": authMap?["username"],
          "password": authMap?["password"],
        },
      );
      final client = SSHClient(
        await SSHSocket.connect(ipServer, 22),
        username: authMap?["username"],
        onPasswordRequest: () => authMap?["password"],
      );
      final dir = await returnDirectoryFiles(client);
      debugPrint(dir);
      final authFile = File("./auth.txt");
      authFile.writeAsStringSync(authData);
      final streamList = await client.execute("touch $authFile");
      final jsonData = utf8.decode(authFile.readAsBytesSync());
      streamList.close();
      return jsonData;
    } catch (e) {
      throw AuthException("Não foi possível realizar o login. ${e.toString()}");
    }
  }

  Future<String> returnDirectoryFiles(SSHClient client) async {
    final dir = await client.execute("ls");
    return utf8.decode(await dir.stdout.first);
  }
}

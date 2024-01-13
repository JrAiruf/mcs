import 'package:mcs/src/imports.dart';

class SSHClientService implements ISSHClientService {
  @override
  Future runCommand(String command) {
    throw UnimplementedError();
  }

  @override
  Future authenticate(Map<String, dynamic> authMap) async {
    final client = SSHClient(
      await SSHSocket.connect(ipServer, 22),
      username: authMap["username"],
      onPasswordRequest: () => authMap["password"],
    );
    final streamList = await client.execute("dir /scripts/");
    // streamList.write(data.convert("auth_session_init"));
    return utf8.decode(await streamList.stdout.first);
  }
}

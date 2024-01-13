import 'dart:io';

import 'package:mcs/src/imports.dart';

class SSHClientService implements ISSHClientService {
  @override
  Future runCommand(String command) {
    throw UnimplementedError();
  }

  @override
  Future<String> authenticate(Map<String, dynamic> authMap) async {
    final client = SSHClient(
      await SSHSocket.connect(ipServer, 22),
      username: authMap["username"],
      onPasswordRequest: () => authMap["password"],
    );
    final authData = jsonEncode(
      {
        "username": authMap["username"],
        "password": authMap["password"],
      },
    );
    await client.execute("cat > /auth/user_data.txt");
    await client.execute(authData);
    final streamList = await client.execute("dir /auth/user_data.txt");
    final jsonData = utf8.decode(await streamList.stdout.first);
    return jsonData;
  }
}

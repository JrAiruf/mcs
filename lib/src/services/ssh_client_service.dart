import 'package:mcs/src/app_imports.dart';

class SSHClientService implements ISSHClientService {
  late SSHClient _client;
  String _filePrefix = "";
  String _authFile = "";
  String _scriptsFile = "";

  @override
  Future<bool> executeScript(String command) async {
    throw UnimplementedError();
  }

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
      _filePrefix = authMap?["username"];
      _authFile = "$_filePrefix.auth.txt";
      _scriptsFile = "$_filePrefix.scripts.txt";
      await _client.execute("echo '$authFileContent' > $_authFile");
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
      String scriptJsonMap = "";
      final userData = await _client.execute("cat $_authFile");
      final jsonUserData = utf8.decode(await userData.stdout.first);
      if (jsonUserData.isNotEmpty) {
        final scriptsListExist = await nullScriptsList();
        if (scriptsListExist) {
          await _client.execute("echo '[]' > $_scriptsFile");
        }
        final scriptsDataList = await _client.execute("cat $_scriptsFile");
        final scriptsJsonList = utf8.decode(await scriptsDataList.stdout.asBroadcastStream().first);
        final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
        script?["id"] = const Uuid().v1();
        scriptsMapsList.insert(0, script);
        final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
        await _client.execute("echo '$convertedListToUpdateServer' > $_scriptsFile");
        scriptJsonMap = jsonEncode(scriptsMapsList.first);
        return scriptJsonMap;
      }
      return scriptJsonMap;
    } catch (e) {
      throw ScriptException("Não foi possível criar um novo script.");
    }
  }

  @override
  Future<String> updateScript(Map<String, dynamic>? script) async {
    try {
      String scriptJsonMap = "";
      final userData = await _client.execute("cat $_authFile");
      final jsonUserData = utf8.decode(await userData.stdout.first);
      if (jsonUserData.isNotEmpty) {
        if (scriptVerifier(script!)) {
          final scriptsDataList = await _client.execute("cat $_scriptsFile");
          final scriptsJsonList = utf8.decode(await scriptsDataList.stdout.asBroadcastStream().first);
          final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
          var currentScript = scriptsMapsList.firstWhere((serverScript) => serverScript["id"] == script["id"]);
          currentScript["name"] = script["name"];
          currentScript["command"] = script["command"];
          currentScript["description"] = script["description"];
          scriptsDataList.stdin.add(utf8.encode(jsonEncode(currentScript)));
          scriptJsonMap = jsonEncode(currentScript);
        } else {
          throw ScriptException("Não foi possível atualizar o script.");
        }
      }
      return scriptJsonMap;
    } catch (e) {
      throw ScriptException("Algo deu errado. $e");
    }
  }

  @override
  Future<String> fetchScriptsList() async {
    try {
      String scriptsJsonList = "";
      final userData = await _client.execute("cat $_authFile");
      final jsonUserData = utf8.decode(await userData.stdout.asBroadcastStream().first);
      if (jsonUserData.isNotEmpty) {
        final scriptsDataList = await _client.execute("cat $_scriptsFile");
        scriptsJsonList = utf8.decode(await scriptsDataList.stdout.asBroadcastStream().first);
      }
      return scriptsJsonList;
    } catch (e) {
      throw ScriptsListException("Não foi possível obter scripts.");
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _client.execute("rm $_authFile").then((value) => value.close());
      return await signedOutUser();
    } catch (e) {
      throw AuthException("Algum erro ocorreu.");
    }
  }

  @override
  Future<String> removeScript(Map<String, dynamic>? script) async {
    try {
      String operationResult = "";
      final userData = await _client.execute("cat $_authFile");
      final jsonUserData = utf8.decode(await userData.stdout.first);
      if (jsonUserData.isNotEmpty) {
        final scriptsDataList = await _client.execute("cat $_scriptsFile");
        final scriptsJsonList = utf8.decode(await scriptsDataList.stdout.asBroadcastStream().first);
        final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
        if (script != null) {
          var currentScript = scriptsMapsList.firstWhere((serverScript) => serverScript["id"] == script["id"]);
          scriptsMapsList.remove(currentScript);
          await _client.execute("rm $_scriptsFile");
          final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
          await _client.execute("echo '$convertedListToUpdateServer' > $_scriptsFile");
          operationResult = "Script removido: ${script["id"]}";
        } else {
          throw ScriptException("Não foi possível remover o script.");
        }
      }
      return operationResult;
    } catch (e) {
      throw ScriptException("Não foi possível remover o script.");
    }
  }

  Future<bool> nullScriptsList() async {
    final nonExistingValue = await _client.execute("cat $_scriptsFile").then(
          (value) async => await value.stdout.asyncMap((event) => event).isEmpty,
        );
    return nonExistingValue;
  }

  Future<bool> signedOutUser() async {
    final nonExistingUser = await _client.execute("cat $_authFile").then(
          (value) async => await value.stdout.asyncMap((event) => event).isEmpty,
        );
    return nonExistingUser;
  }

  bool scriptVerifier(Map script) {
    bool verified = true;
    for (var i = 0; i < script.values.length; i++) {
      var value = script.values.toList()[i];
      if (value.toString().isEmpty) {
        verified = false;
        throw ScriptException("Formato inválido!");
      }
    }
    return verified;
  }
}

import 'package:mcs/src/app_imports.dart';

class SSHClientService implements ISSHClientService {
  late SSHClient _client;
  String _filePrefix = "";
  String _authFile = "";
  String _scriptsFile = "";

  @override
  Future<String> executeScript(Map<String, dynamic>? script) async {
    try {
      String executionResult = "";
      final getAuthDataResult = await _client.execute("cat authData.txt");
      final result = utf8.decode(await getAuthDataResult.stdout.asBroadcastStream().first);
      if (result.isNotEmpty) {
        await _client.execute("${script?["command"]}");
        executionResult = jsonEncode(script);
        return executionResult;
      }
      return executionResult;
    } catch (e) {
      throw ScriptException("Não foi possível executar o script ${script?["name"]}");
    }
  }

  @override
  Future<String> authenticate(Map<String, dynamic>? authMap) async {
    try {
      String userData = "";
      _client = SSHClient(
        await SSHSocket.connect(ipServer, 22),
        username: authMap?["username"],
        onPasswordRequest: () => authMap?["password"],
        keepAliveInterval: const Duration(minutes: 30),
      );
      final authJson = jsonEncode(authMap);
      final authData = base64.encode(authJson.codeUnits);
      await _client.execute("echo '$authData' > authData.txt");
      final executionResult = await _client.execute("cat authData.txt");
      final authResult = utf8.decode(await executionResult.stdout.asBroadcastStream().first);
      if (authResult.isNotEmpty) {
        userData = jsonEncode(authMap);
        _filePrefix = authMap?["username"];
        _authFile = userData;
        _scriptsFile = "$_filePrefix.scripts.txt";
        return userData;
      }
      return userData;
    } catch (e) {
      throw AuthException("Não foi possível realizar o login. ${e.toString()}");
    }
  }

  @override
  Future<String> saveScript(Map<String, dynamic>? script) async {
    try {
      String scriptJsonMap = "";
      final userData = await _client.run("cat $_authFile");
      final jsonUserData = utf8.decode(userData);
      if (jsonUserData.isNotEmpty) {
        final scriptsListExist = await nullScriptsList();
        if (scriptsListExist) {
          await _client.run("echo '[]' > $_scriptsFile");
        }
        final scriptsDataList = await _client.run("cat $_scriptsFile");
        final scriptsMapsList = jsonDecode(utf8.decode(scriptsDataList)) as List;
        script?["id"] = const Uuid().v1();
        scriptsMapsList.insert(0, script);
        final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
        await _client.run("echo '$convertedListToUpdateServer' > $_scriptsFile");
        scriptJsonMap = jsonEncode(scriptsMapsList.first);
        return scriptJsonMap;
      }
      return scriptJsonMap;
    } catch (e) {
      throw ScriptException("Não foi possível criar um novo script. ${e.toString()}");
    }
  }

  @override
  Future<String> updateScript(Map<String, dynamic>? script) async {
    try {
      String scriptJsonMap = "";
      if (_authFile.isNotEmpty) {
        if (scriptVerifier(script!)) {
          final scriptsDataList = await _client.run("cat $_scriptsFile");
          final scriptsJsonList = utf8.decode(scriptsDataList);
          final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
          final currentScript = scriptsMapsList.firstWhere((serverScript) => serverScript["id"] == script["id"]);
          currentScript["name"] = script["name"];
          currentScript["command"] = script["command"];
          currentScript["description"] = script["description"];
          scriptsMapsList.removeWhere((serverScript) => serverScript["id"] == script["id"]);
          scriptsMapsList.add(currentScript);
          final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
          await _client.run("rm $_scriptsFile");
          await _client.run("echo '$convertedListToUpdateServer' > $_scriptsFile");
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
      if (_authFile.isNotEmpty) {
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
      _authFile = "";
      _client.close();
      return _authFile.isEmpty;
    } catch (e) {
      throw AuthException("Algum erro ocorreu.");
    }
  }

  @override
  Future<String> removeScript(Map<String, dynamic>? script) async {
    try {
      String operationResult = "";
      if (_authFile.isNotEmpty) {
        final scriptsDataList = await _client.execute("cat $_scriptsFile");
        final scriptsJsonList = utf8.decode(await scriptsDataList.stdout.asBroadcastStream().first);
        final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
        if (script != null) {
          var currentScript = scriptsMapsList.firstWhere((serverScript) => serverScript["id"] == script["id"]);
          scriptsMapsList.remove(currentScript);
          await _client.execute("rm $_scriptsFile");
          final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
          await _client.execute("echo '$convertedListToUpdateServer' > $_scriptsFile");
          operationResult = "Script removido: ${script["name"]}";
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

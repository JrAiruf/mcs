import 'dart:developer';

import 'package:mcs/src/app_imports.dart';

class AppSSH implements ISSHClientService {
  late SSHClient _client;

  String _filePrefix = "";
  String _authFile = "";
  String _scriptsFile = "";

  @override
  Future<String> executeScript(Map<String, dynamic>? script) async {
    try {
      String? executionResult = "";
      if (_authFile.isNotEmpty) {
        await _client.execute(script?["command"]) ?? "";
        executionResult = await _client.execute("yes") ?? "";
        log(executionResult);
      }
      return jsonEncode(script);
    } catch (e) {
      throw ScriptException("Não foi possível executar o script ${script?["name"]}");
    }
  }

  @override
  Future<String> authenticate(Map<String, dynamic>? authMap) async {
    try {
      String userData = "";
      _client = SSHClient(
        host: ipServer,
        port: 22,
        username: authMap?["username"],
        passwordOrKey: authMap?["password"],
      );
      await _client.connect();
      final authJson = jsonEncode(authMap);
      final authData = base64.encode(authJson.codeUnits);
      await _client.execute("echo '$authData' > authData.txt");
      final executionResult = await _client.execute("cat authData.txt");
      final authResult = utf8.decode(executionResult!.codeUnits);
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
      final userData = await _client.execute("cat authData.txt");
      final jsonUserData = utf8.decode(userData!.codeUnits);
      if (jsonUserData.isNotEmpty) {
        final scriptsListExist = await nullScriptsList();
        if (scriptsListExist) {
          await _client.execute("echo '[]' > $_scriptsFile");
        }
        final scriptsDataList = await _client.execute("cat $_scriptsFile");
        final scriptsMapsList = jsonDecode(scriptsDataList ?? "[]") as List;
        script?["id"] = const Uuid().v1();
        scriptsMapsList.insert(0, script);
        final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
        await _client.execute("echo '$convertedListToUpdateServer' > $_scriptsFile");
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
          final scriptsDataList = await _client.execute("cat $_scriptsFile");
          final scriptsJsonList = scriptsDataList ?? "[]";
          final scriptsMapsList = jsonDecode(scriptsJsonList) as List;
          final currentScript = scriptsMapsList.firstWhere((serverScript) => serverScript["id"] == script["id"]);
          currentScript["name"] = script["name"];
          currentScript["command"] = script["command"];
          currentScript["description"] = script["description"];
          scriptsMapsList.removeWhere((serverScript) => serverScript["id"] == script["id"]);
          scriptsMapsList.add(currentScript);
          final convertedListToUpdateServer = jsonEncode(scriptsMapsList);
          await _client.execute("rm $_scriptsFile");
          await _client.execute("echo '$convertedListToUpdateServer' > $_scriptsFile");
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
        scriptsJsonList = scriptsDataList ?? "[]";
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
      _client.disconnect();
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
        final scriptsJsonList = scriptsDataList ?? "[]";
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
          (value) => value!.isEmpty,
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

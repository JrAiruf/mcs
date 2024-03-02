import 'package:mcs/src/app_imports.dart';

abstract class ScriptMockData {
  static final entity = Script(
    id: "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    name: "Ativar North",
    command: "NORTH_ATIVA",
  );
  static final executionScript = ScriptExecution(
    script: entity,
    executionLog: "spawn 177.83.34.255@escambau",
  );

  static final modifiedEntity = Script(
    id: "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    name: "Ativar North",
    command: "NORTH_ATIVA",
    description: "Script with description",
  );
  static final _scriptEntity0 = Script(
    id: "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    name: "Desativar North",
    command: "NORTH_DESATIVA",
  );
  static final _scriptEntity1 = Script(
    id: "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    name: "Outro Script",
    command: "OUTRO_COMANDO",
  );
  static final scriptMap = {
    "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    "name": "Ativar North",
    "command": "NORTH_ATIVA",
    "description": "test",
  };
  static final executionScriptMap = {
    "script": scriptMap,
    "executionLog": "Ativar North",
  };
  static final executeScriptMap = {
    "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    "name": "BKP ATIVA",
    "command": "/scripts/BKP_ATIVA",
    "description": "Ativar o tráfego via BKP",
  };
  static final creationScriptMap = {
    "name": "Ativar North",
    "command": "NORTH_ATIVA",
    "description": "test",
  };
  static final modifiedScriptMap = {
    "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    "name": "Ativar North",
    "command": "NORTH_ATIVA",
    "description": "Script with description",
  };
  static final wrongScriptMap = {
    "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    "name": "Ativar North",
    "command": "",
    "description": "Script with description",
  };
  static final scriptJsonMap = jsonEncode(
    {
      "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
      "name": "Ativar North",
      "command": "NORTH_ATIVA",
      "description": "ScriptDescription",
    },
  );
  static final modifiedScriptJsonMap = jsonEncode(
    {
      "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
      "name": "Ativar North",
      "command": "NORTH_ATIVA",
      "description": "Script with description",
    },
  );
  static final _scriptMap0 = {
    "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    "name": "Desativar North",
    "command": "NORTH_DESATIVA",
    "description": "script description",
  };
  static final _scriptMap1 = {
    "id": "7f2cd6c0-b855-11ee-bc9e-93b2374d10ad",
    "name": "Outro Script",
    "command": "OUTRO_COMANDO",
    "description": "script description",
  };
  static final scriptsMapsList = [
    scriptMap,
    _scriptMap0,
    _scriptMap1,
  ];
  static final scriptsList = [
    entity,
    _scriptEntity0,
    _scriptEntity1,
  ];
}

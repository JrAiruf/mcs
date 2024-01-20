import 'package:mcs/src/app_imports.dart';

abstract class ScriptMockData {
  static final entity = Script(name: "Ativar North", command: "NORTH_ATIVA");
  static final modifiedEntity = Script(name: "Ativar North", command: "NORTH_ATIVA", description: "Script with description");
  static final _scriptEntity0 = Script(name: "Desativar North", command: "NORTH_DESATIVA");
  static final _scriptEntity1 = Script(name: "Outro Script", command: "OUTRO_COMANDO");
  static final scriptMap = {"name": "Ativar North", "command": "NORTH_ATIVA", "description": "test"};
  static final modifiedScriptMap = {"name": "Ativar North", "command": "NORTH_ATIVA", "description": "Script with description"};
  static final wrongScriptMap = {"name": "Ativar North", "command": "", "description": "Script with description"};
  static final scriptJsonMap = jsonEncode({"name": "Ativar North", "command": "NORTH_ATIVA"});
  static final modifiedScriptJsonMap = jsonEncode({"name": "Ativar North", "command": "NORTH_ATIVA", "description": "Script with description"});
  static final _scriptMap0 = {"name": "Desativar North", "command": "NORTH_DESATIVA"};
  static final _scriptMap1 = {"name": "Outro Script", "command": "OUTRO_COMANDO"};
  static final scriptsMapsList = [scriptMap, _scriptMap0, _scriptMap1];
  static final scriptsList = [entity, _scriptEntity0, _scriptEntity1];
}

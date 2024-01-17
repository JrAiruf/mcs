import 'package:mcs/src/app_imports.dart';

abstract class ScriptMockData {
  static final scriptEntity = Script(name: "Ativar North", command: "NORTH_ATIVA");
  static final _scriptEntity0 = Script(name: "Desativar North", command: "NORTH_DESATIVA");
  static final _scriptEntity1 = Script(name: "Outro Script", command: "OUTRO_COMANDO");
  static final scriptMap = {"name": "Ativar North", "command": "NORTH_ATIVA"};
  static final scriptJsonMap = jsonEncode({"name": "Ativar North", "command": "NORTH_ATIVA"});
  static final _scriptMap0 = {"name": "Desativar North", "command": "NORTH_DESATIVA"};
  static final _scriptMap1 = {"name": "Outro Script", "command": "OUTRO_COMANDO"};
  static final scriptsMapsList = [scriptMap, _scriptMap0, _scriptMap1];
  static final scriptsList = [scriptEntity, _scriptEntity0, _scriptEntity1];
}

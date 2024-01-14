import 'package:mcs/src/app_imports.dart';

abstract class ScriptMockData {
  static final scriptEntity = Script(name: "Ativar North", command: "NORTH_ATIVA");
  static final scriptMap = {"name": "Ativar North", "command": "NORTH_ATIVA"};
  static final scriptMap0 = {"name": "Desativar North", "command": "NORTH_DESATIVA"};
  static final scriptMap1 = {"name": "Outro Script", "command": "OUTRO_COMANDO"};
  static final scriptsList = [scriptMap, scriptMap0, scriptMap1];
}

import 'package:mcs/src/app_imports.dart';

class ScriptController {
  //BLOCS
  final fetchScriptsListBloc = Modular.get<FetchScriptsListBloc>();
  final saveScriptBloc = Modular.get<SaveScriptBloc>();
  //PROPS
  Script script = Script();
  //KEYS
  final scriptKey = GlobalKey<FormState>();
  //INPUTS
  final scriptName = TextEditingController();
  final scriptCommand = TextEditingController();
  //FUNCTIONS
  saveScript() {
    script.setName(scriptName.text);
    script.setCommand(scriptCommand.text);
    saveScriptBloc.add(SaveScriptEvent(script));
    scriptName.clear();
    scriptCommand.clear();
  }

  fetchScriptsList() => fetchScriptsListBloc.add(FetchScriptsListEvent());
}

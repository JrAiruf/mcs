import 'package:mcs/src/app_imports.dart';

class ScriptController {
  //BLOCS
  final fetchScriptsListBloc = Modular.get<FetchScriptsListBloc>();
  final scriptBloc = Modular.get<ScriptBloc>();
  //PROPS
  Script script = Script();
  //KEYS
  final scriptKey = GlobalKey<FormState>();
  //INPUTS
  final scriptName = TextEditingController();
  final scriptCommand = TextEditingController();
  final scriptDescription = TextEditingController();
  //FUNCTIONS
  saveScript() {
    script.setName(scriptName.text);
    script.setCommand(scriptCommand.text);
    scriptBloc.add(CreateScriptEvent(script));
    scriptName.clear();
    scriptCommand.clear();
  }

  updateScript() {
    script.setDescription(scriptDescription.text);
    scriptBloc.add(UpdateScriptEvent(script));
    scriptDescription.clear();
  }

  fetchScriptsList() => fetchScriptsListBloc.add(FetchScriptsListEvent());
}

import 'package:mcs/src/app_imports.dart';

class ScriptController {
  //BLOCS
  final fetchScriptsListBloc = Modular.get<FetchScriptsListBloc>();
  final saveScriptBloc = Modular.get<SaveScriptBloc>();
  //PROPS
  Script script = Script();
  //KEYS
  final scriptKey = GlobalKey<FormState>();
  //FUNCTIONS
  saveScript() => saveScriptBloc.add(SaveScriptEvent(script));
  fetchScriptsList() => fetchScriptsListBloc.add(FetchScriptsListEvent());
}

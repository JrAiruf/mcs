import 'package:mcs/src/app_imports.dart';

class ScriptController {
  //BLOCS
  final fetchScriptsListBloc = Modular.get<FetchScriptsListBloc>();
  final scriptBloc = Modular.get<ScriptBloc>();
  //PROPS
  late Script script;
  //KEYS
  final createScriptKey = GlobalKey<FormState>();
  final updateScriptKey = GlobalKey<FormState>();
  //INPUTS
  final scriptName = TextEditingController();
  final scriptCommand = TextEditingController();
  final scriptDescription = TextEditingController();
  //FUNCTIONS
  saveScript() {
    createScriptKey.currentState?.validate();
    if (createScriptKey.currentState!.validate()) {
      script = Script();
      createScriptKey.currentState?.save();
      script.setName(scriptName.text);
      script.setCommand(scriptCommand.text);
      scriptBloc.add(CreateScriptEvent(script));
      scriptName.clear();
      scriptCommand.clear();
      script = Script();
    }
  }

  updateScript() {
    updateScriptKey.currentState?.validate();
    if (updateScriptKey.currentState!.validate()) {
      updateScriptKey.currentState?.save();
      script.setDescription(scriptDescription.text);
      scriptBloc.add(UpdateScriptEvent(script));
      scriptDescription.clear();
      script.setDescription("");
    }
  }

  removeScript(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (_) {
          return appDialog(
            context,
            "Deseja Remover este Script?",
            "O script removido será deletado da Lista de Scripts, e será cancelado automaticamente.",
            () {
              scriptBloc.add(RemoveScriptEvent(script));
              Navigator.of(context).pop();
            },
            () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  executeScript(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (_) {
          return appDialog(
            context,
            "Deseja Executar este Script?",
            "O script ${script.name} será executado aplicando as ações informadas na descrição",
            () {
              scriptBloc.add(ExecuteScriptEvent(script));
              Navigator.of(context).pop();
            },
            () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  fetchScriptsList() => fetchScriptsListBloc.add(FetchScriptsListEvent());

  scriptsSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppThemes.activeColor,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: AppThemes.contrastColor,
            ),
          ),
        ),
      ),
    );
  }
}

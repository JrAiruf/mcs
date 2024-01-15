part of 'scripts_bloc.dart';

@immutable
sealed class ScriptEvents {}

final class SaveScriptEvent extends ScriptEvents {
  final Script script;
  SaveScriptEvent(this.script);
}

final class FetchScriptsEvent extends ScriptEvents {
  FetchScriptsEvent();
}

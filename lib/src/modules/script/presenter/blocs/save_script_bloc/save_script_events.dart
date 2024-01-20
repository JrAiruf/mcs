part of 'save_script_bloc.dart';

@immutable
sealed class ScriptEvents {}

final class SaveScriptEvent extends ScriptEvents {
  final Script script;
  SaveScriptEvent(this.script);
}

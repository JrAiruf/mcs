part of 'save_script_bloc.dart';

@immutable
sealed class SaveScriptEvents {}

final class SaveScriptEvent extends SaveScriptEvents {
  final Script script;
  SaveScriptEvent(this.script);
}

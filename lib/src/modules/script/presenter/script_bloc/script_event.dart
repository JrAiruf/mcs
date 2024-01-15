part of 'script_bloc.dart';

@immutable
sealed class ScriptEvents {}

final class ScriptEvent extends ScriptEvents {
  final Script script;

  ScriptEvent(this.script);
}

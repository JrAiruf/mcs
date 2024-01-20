part of 'script_bloc.dart';

@immutable
sealed class ScriptEvents {}

final class CreateScriptEvent extends ScriptEvents {
  final Script script;
  CreateScriptEvent(this.script);
}

final class UpdateScriptEvent extends ScriptEvents {
  final Script script;
  UpdateScriptEvent(this.script);
}

final class RemoveScriptEvent extends ScriptEvents {
  final Script script;
  RemoveScriptEvent(this.script);
}

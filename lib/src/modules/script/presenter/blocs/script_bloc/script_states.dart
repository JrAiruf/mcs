part of 'script_bloc.dart';

@immutable
sealed class ScriptStates {}

final class ScriptInitialState extends ScriptStates {}

final class ScriptLoadingState extends ScriptStates {}

final class ScriptFailureState extends ScriptStates {
  final String message;

  ScriptFailureState(this.message);
}

final class CreateScriptSuccessState extends ScriptStates {
  final Script script;

  CreateScriptSuccessState(this.script);
}
final class ExecuteScriptSuccessState extends ScriptStates {
  final Script script;

  ExecuteScriptSuccessState(this.script);
}

final class UpdateScriptSuccessState extends ScriptStates {
  final Script script;

  UpdateScriptSuccessState(this.script);
}

final class RemoveScriptSuccessState extends ScriptStates {
  final String message;

  RemoveScriptSuccessState(this.message);
}

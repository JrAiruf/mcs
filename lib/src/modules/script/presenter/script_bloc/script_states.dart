part of 'script_bloc.dart';

@immutable
sealed class ScriptStates {}

final class ScriptInitialState extends ScriptStates {}

final class ScriptLoadingState extends ScriptStates {}

final class ScriptFailureState extends ScriptStates {
  final String message;

  ScriptFailureState(this.message);
}

final class ScriptSuccessState extends ScriptStates {
  final Script script;

  ScriptSuccessState(this.script);
}

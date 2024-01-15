part of 'save_script_bloc.dart';

@immutable
sealed class SaveScriptStates {}

final class SaveScriptInitialState extends SaveScriptStates {}

final class SaveScriptLoadingState extends SaveScriptStates {}

final class SaveScriptFailureState extends SaveScriptStates {
  final String message;

  SaveScriptFailureState(this.message);
}

final class SaveScriptSuccessState extends SaveScriptStates {
  final Script script;

  SaveScriptSuccessState(this.script);
}

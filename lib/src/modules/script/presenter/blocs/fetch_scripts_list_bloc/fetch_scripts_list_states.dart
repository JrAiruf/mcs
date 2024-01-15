part of 'fetch_scripts_list_bloc.dart';

@immutable
sealed class FetchScriptsListStates {}

final class FetchScriptsListInitialState extends FetchScriptsListStates {}

final class FetchScriptsListLoadingState extends FetchScriptsListStates {}

final class FetchScriptsListFailureState extends FetchScriptsListStates {
  final String message;

  FetchScriptsListFailureState(this.message);
}

final class FetchScriptsListSuccessState extends FetchScriptsListStates {
  final List<Script> script;

  FetchScriptsListSuccessState(this.script);
}

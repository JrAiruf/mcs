import 'package:mcs/src/app_imports.dart';
part 'fetch_scripts_list_events.dart';
part 'fetch_scripts_list_states.dart';

class FetchScriptsListBloc extends Bloc<FetchScriptsListEvents, FetchScriptsListStates> {
  FetchScriptsListBloc(FetchScriptsList fetchScriptsList)
      : _fetchScriptsList = fetchScriptsList,
        super(FetchScriptsListInitialState()) {
    on<FetchScriptsListEvent>(_mapSaveScriptEventToState);
  }

  final FetchScriptsList _fetchScriptsList;

  _mapSaveScriptEventToState(FetchScriptsListEvent event, Emitter<FetchScriptsListStates> state) async {
    state(FetchScriptsListLoadingState());
    final result = await _fetchScriptsList();
    result.fold(
      (left) => state(FetchScriptsListFailureState(left.message)),
      (right) => state(FetchScriptsListSuccessState(right)),
    );
  }
}

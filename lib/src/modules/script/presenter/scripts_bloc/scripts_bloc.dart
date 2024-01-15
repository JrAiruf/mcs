import 'package:mcs/src/app_imports.dart';
part 'scripts_event.dart';
part 'scripts_states.dart';

class ScriptBloc extends Bloc<ScriptEvents, ScriptStates> {
  ScriptBloc(FetchScriptsList fetchScriptsList)
      : _fetchScriptsList = fetchScriptsList,
        super(ScriptInitialState()) {
    on<SaveScriptEvent>(_mapSaveScriptEventToState);
  }

  final FetchScriptsList _fetchScriptsList;

  _mapSaveScriptEventToState(SaveScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _fetchScriptsList();
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(ScriptSuccessState(right)),
    );
  }
}

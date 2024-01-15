import 'package:mcs/src/app_imports.dart';
import 'package:mcs/src/modules/script/domain/usecases/fetch_scripts_list.dart';
part 'script_event.dart';
part 'script_states.dart';

class ScriptBloc extends Bloc<ScriptEvents, ScriptStates> {
  ScriptBloc(FetchScriptsList fetchScriptsList)
      : _fetchScriptsList = fetchScriptsList,
        super(ScriptInitialState()) {
    on<ScriptEvent>(_mapScriptEventToState);
  }

  final FetchScriptsList _fetchScriptsList;

  _mapScriptEventToState(ScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _fetchScriptsList();
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(ScriptSuccessState(right)),
    );
  }
}

import 'package:mcs/src/app_imports.dart';
part 'save_script_events.dart';
part 'save_script_states.dart';

class SaveScriptBloc extends Bloc<ScriptEvents, SaveScriptStates> {
  SaveScriptBloc(SaveScript saveScript)
      : _saveScript = saveScript,
        super(SaveScriptInitialState()) {
    on<SaveScriptEvent>(_mapSaveScriptEventToState);
  }

  final SaveScript _saveScript;

  _mapSaveScriptEventToState(SaveScriptEvent event, Emitter<SaveScriptStates> state) async {
    state(SaveScriptLoadingState());
    final result = await _saveScript(event.script);
    result.fold(
      (left) => state(SaveScriptFailureState(left.message)),
      (right) => state(SaveScriptSuccessState(right)),
    );
  }
}

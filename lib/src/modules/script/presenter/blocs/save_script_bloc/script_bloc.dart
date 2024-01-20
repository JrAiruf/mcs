import 'package:mcs/src/app_imports.dart';
part 'script_events.dart';
part 'script_states.dart';

class ScriptBloc extends Bloc<ScriptEvents, ScriptStates> {
  ScriptBloc(SaveScript saveScript, UpdateScript updateScript)
      : _saveScript = saveScript,
        _updateScript = updateScript,
        super(ScriptInitialState()) {
    on<CreateScriptEvent>(_mapCreateScriptEventToState);
    on<UpdateScriptEvent>(_mapUpdateScriptEventToState);
  }

  final SaveScript _saveScript;
  final UpdateScript _updateScript;

  _mapCreateScriptEventToState(CreateScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _saveScript(event.script);
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(CreateScriptSuccessState(right)),
    );
  }

  _mapUpdateScriptEventToState(UpdateScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _updateScript(event.script);
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(UpdateScriptSuccessState(right)),
    );
  }
}

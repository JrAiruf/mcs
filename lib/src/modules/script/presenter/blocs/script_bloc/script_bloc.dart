import 'package:mcs/src/app_imports.dart';
part 'script_events.dart';
part 'script_states.dart';

class ScriptBloc extends Bloc<ScriptEvents, ScriptStates> {
  ScriptBloc(SaveScript saveScript, UpdateScript updateScript, RemoveScript removeScript)
      : _saveScript = saveScript,
        _updateScript = updateScript,
        _removeScript = removeScript,
        super(ScriptInitialState()) {
    on<CreateScriptEvent>(_mapCreateScriptEventToState);
    on<UpdateScriptEvent>(_mapUpdateScriptEventToState);
    on<RemoveScriptEvent>(_mapRemoveScriptEventToState);
  }

  final SaveScript _saveScript;
  final UpdateScript _updateScript;
  final RemoveScript _removeScript;

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

  _mapRemoveScriptEventToState(RemoveScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _removeScript(event.script);
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(RemoveScriptSuccessState(right)),
    );
  }
}

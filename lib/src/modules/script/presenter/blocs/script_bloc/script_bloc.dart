import 'package:mcs/src/app_imports.dart';
part 'script_events.dart';
part 'script_states.dart';

class ScriptBloc extends Bloc<ScriptEvents, ScriptStates> {
  ScriptBloc(SaveScript saveScript, ExecuteScript executeScript, UpdateScript updateScript, RemoveScript removeScript)
      : _saveScript = saveScript,
        _executeScript = executeScript,
        _updateScript = updateScript,
        _removeScript = removeScript,
        super(ScriptInitialState()) {
    on<CreateScriptEvent>(_mapCreateScriptEventToState);
    on<ExecuteScriptEvent>(_mapExecuteScriptEventToState);
    on<UpdateScriptEvent>(_mapUpdateScriptEventToState);
    on<RemoveScriptEvent>(_mapRemoveScriptEventToState);
  }

  final SaveScript _saveScript;
  final ExecuteScript _executeScript;
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

  _mapExecuteScriptEventToState(ExecuteScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _executeScript(event.script);
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(ExecuteScriptSuccessState(right)),
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
    final result = await _removeScript(event.script);
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(RemoveScriptSuccessState(right)),
    );
  }
}

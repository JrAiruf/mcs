import 'package:mcs/src/app_imports.dart';
part 'script_event.dart';
part 'script_states.dart';

class ScriptBloc extends Bloc<ScriptEvents, ScriptStates> {
  ScriptBloc(IScriptRepository repository)
      : _repository = repository,
        super(ScriptInitialState()) {
    on<ScriptEvent>(_mapScriptEventToState);
  }

  final IScriptRepository _repository;

  _mapScriptEventToState(ScriptEvent event, Emitter<ScriptStates> state) async {
    state(ScriptLoadingState());
    final result = await _repository.saveScript(event.script);
    result.fold(
      (left) => state(ScriptFailureState(left.message)),
      (right) => state(ScriptSuccessState(right)),
    );
  }
}

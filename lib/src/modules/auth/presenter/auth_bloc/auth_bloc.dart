import 'package:mcs/src/imports.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(IAuthRepository repository)
      : _repository = repository,
        super(AuthInitialState()) {
    on<AuthEvent>(_mapAuthEventToState);
  }

  final IAuthRepository _repository;

  _mapAuthEventToState(AuthEvent event, Emitter<AuthStates> state) async {
    state(AuthLoadingState());
    final result = await _repository.authenticate(event.authEntity);
    result.fold(
      (left) => state(AuthFailureState(left.message)),
      (right) => state(AuthSuccessState(right)),
    );
  }
}

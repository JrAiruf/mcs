import 'package:mcs/src/app_imports.dart';
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
    await Future.delayed(const Duration(seconds: 2));
    final result = await _repository.authenticate(event.authEntity);
    result.fold(
      (left) => state(AuthFailureState(left.message)),
      (right) => state(AuthSuccessState(right)),
    );
  }
}

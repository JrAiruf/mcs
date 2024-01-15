import 'package:mcs/src/app_imports.dart';
part 'auth_event.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(Login login)
      : _login = login,
        super(AuthInitialState()) {
    on<AuthEvent>(_mapAuthEventToState);
  }

  final Login _login;

  _mapAuthEventToState(AuthEvent event, Emitter<AuthStates> state) async {
    state(AuthLoadingState());
    final result = await _login(event.authEntity);
    result.fold(
      (left) => state(AuthFailureState(left.message)),
      (right) => state(AuthSuccessState(right)),
    );
  }
}

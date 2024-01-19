import 'package:mcs/src/app_imports.dart';
part 'auth_event.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(Login login, SignOut signOut)
      : _login = login,
        _signOut = signOut,
        super(AuthInitialState()) {
    on<AuthEvent>(_mapAuthEventToState);
    on<SignOutEvent>(_mapSignOutEventToState);
  }

  final Login _login;
  final SignOut _signOut;

  _mapAuthEventToState(AuthEvent event, Emitter<AuthStates> state) async {
    state(AuthLoadingState());
    final result = await _login(event.authEntity);
    result.fold(
      (left) => state(AuthFailureState(left.message)),
      (right) => state(AuthSuccessState(right)),
    );
  }

  _mapSignOutEventToState(SignOutEvent event, Emitter<AuthStates> state) async {
    state(AuthLoadingState());
    final result = await _signOut();
    result.fold(
      (left) => state(AuthFailureState(left.message)),
      (right) => state(AuthSignOutState()),
    );
  }
}

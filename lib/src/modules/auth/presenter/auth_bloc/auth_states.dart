part of 'auth_bloc.dart';

@immutable
sealed class AuthStates {}

final class AuthInitialState extends AuthStates {}

final class AuthLoadingState extends AuthStates {}

final class AuthFailureState extends AuthStates {
  final String message;

  AuthFailureState(this.message);
}

final class AuthSuccessState extends AuthStates {
  final AuthEntity authEntity;

  AuthSuccessState(this.authEntity);
}

final class AuthSignOutState extends AuthStates {}

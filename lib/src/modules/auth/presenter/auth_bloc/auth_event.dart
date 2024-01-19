part of 'auth_bloc.dart';

@immutable
sealed class AuthEvents {}

final class AuthEvent extends AuthEvents {
  final AuthEntity authEntity;

  AuthEvent(this.authEntity);
}

final class SignOutEvent extends AuthEvents {
  SignOutEvent();
}

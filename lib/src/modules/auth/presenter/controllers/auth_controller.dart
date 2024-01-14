import 'package:mcs/src/imports.dart';

class AuthController {
  final authBloc = Modular.get<AuthBloc>();
  AuthEntity authEntity = AuthEntity("", "");

  bool visiblePassword = false;
}

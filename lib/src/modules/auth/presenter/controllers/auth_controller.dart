import 'package:mcs/src/app_imports.dart';

class AuthController {
  final authBloc = Modular.get<AuthBloc>();
  AuthEntity authEntity = AuthEntity(username: "", password: "");
  final authKey = GlobalKey<FormState>();
  bool visiblePassword = false;

  void authenticate() {
    authKey.currentState?.validate();
    if (authKey.currentState!.validate()) {
      authBloc.add(AuthEvent(authEntity));
    } else {
      authErrorSnackbar("Dados inválidos! Por favor preencha os campos.");
    }
  }

  authSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepOrange,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: AppThemes.contrastColor,
            ),
          ),
        ),
      ),
    );
  }

  authErrorSnackbar(String message) {
    return SnackBar(
      backgroundColor: Colors.deepOrange,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: AppThemes.contrastColor,
          ),
        ),
      ),
    );
  }
}

import 'package:mcs/src/app_imports.dart';

class AuthController {
//BLOCS
  final authBloc = Modular.get<AuthBloc>();
//PROPS
  AuthEntity authEntity = AuthEntity();
  bool visiblePassword = false;
//KEYS
  final authKey = GlobalKey<FormState>();
//FUNCTIONS
  void authenticate() {
    authKey.currentState?.validate();
    if (authKey.currentState!.validate()) {
      authBloc.add(AuthEvent(authEntity));
    } else {
      authErrorSnackbar("Dados inválidos! Por favor preencha os campos.");
    }
  }
  void signOut() => authBloc.add(SignOutEvent());

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

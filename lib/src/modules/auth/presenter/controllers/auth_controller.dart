import 'package:mcs/src/app_imports.dart';
import 'package:mcs/src/shared/components/app_dialog.dart';

class AuthController {
//BLOCS
  final authBloc = Modular.get<AuthBloc>();
//CONTROLLERS
  final username = TextEditingController();
  final password = TextEditingController();
//PROPS
  AuthEntity authEntity = AuthEntity();
  bool visiblePassword = false;
//KEYS
  final authKey = GlobalKey<FormState>();
//FUNCTIONS
  void authenticate() {
    authEntity.setUsername(username.text);
    authEntity.setPassword(password.text);
    authKey.currentState!.validate();
    authKey.currentState!.save();
    if (authKey.currentState!.validate()) {
      authBloc.add(AuthEvent(authEntity));
      username.clear();
      password.clear();
    } else {
      authErrorSnackbar("Dados inválidos! Por favor preencha os campos.");
    }
  }

  void signOut(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (_) {
          return appDialog(
            context,
            "Deseja sair do Servidor?",
            "Após o logout será necessária uma nova autenticação para executar qualquer ação.",
            () {
              authBloc.add(SignOutEvent());
              Navigator.of(context).pop();
            },
            () {
              Navigator.of(context).pop();
            },
          );
        });
    authEntity = AuthEntity();
  }

  authSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepOrange,
        content: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
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

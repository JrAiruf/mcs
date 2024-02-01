import 'package:mcs/src/app_imports.dart';

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
      saveUserdataLocally(username.text, password.text);
      username.clear();
      password.clear();
    } else {
      authErrorSnackbar("Dados inválidos! Por favor preencha os campos.");
    }
  }

  void authenticateWithSavedData(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storedUsername = sharedPreferences.getString("username");
    final storedPassword = sharedPreferences.getString("password");
    if (storedUsername != null && storedPassword != null) {
      authEntity.setUsername(storedUsername);
      authEntity.setPassword(storedPassword);
      authBloc.add(AuthEvent(authEntity));
      authBloc.stream.listen(
        (state) {
          if (state is AuthFailureState) {
            authSnackbar(context, state.message);
          }
        },
      );
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
              clearUserdata();
            },
            () {
              Navigator.of(context).pop();
            },
          );
        });
    authEntity = AuthEntity();
  }

  void saveUserdataLocally(String usernameInShared, String passwordInShared) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('username', usernameInShared);
    sharedPreferences.setString('password', passwordInShared);
  }

  void clearUserdata() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('username');
    sharedPreferences.remove('password');
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

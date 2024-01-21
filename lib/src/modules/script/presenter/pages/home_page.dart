import '../../../../app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final _controller = Modular.get<ScriptController>();
final _authController = Modular.get<AuthController>();
AuthEntity _authEntity = Modular.args.data;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _controller.fetchScriptsList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.scriptBloc.stream.listen((state) {
      if (state is CreateScriptSuccessState) {
        _controller.fetchScriptsList();
      }
      if (state is RemoveScriptSuccessState) {
        _controller.fetchScriptsList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final userName = "${_authEntity.username?.substring(0, 1).toUpperCase()}${_authEntity.username?.substring(1)}";
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppThemes.primaryColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        color: AppThemes.contrastColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    BlocConsumer(
                        bloc: _authController.authBloc,
                        listener: (_, state) {
                          if (state is AuthSignOutState) {
                            Modular.to.navigate("/auth/");
                          }
                        },
                        builder: (_, state) {
                          return IconButton(
                            onPressed: () => _authController.signOut(context),
                            icon: const Icon(
                              Icons.logout,
                              size: 35,
                              color: AppThemes.contrastColor,
                            ),
                          );
                        }),
                  ],
                ),
                const SizedBox(height: 15),
                CreateScriptForm(controller: _controller),
                const SizedBox(height: 15),
                const Text(
                  "Meus Scripts",
                  style: TextStyle(
                    color: AppThemes.contrastColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 15),
                ScriptsListComponent(controller: _controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:mcs/src/imports.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/splash/");
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
    );
  }
}
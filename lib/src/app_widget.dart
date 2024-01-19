// ignore_for_file: unused_field
import 'package:mcs/src/app_imports.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}
class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute("/splash/");
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}

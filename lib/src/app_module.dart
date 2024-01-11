import 'package:mcs/src/imports.dart';
import 'modules/splash/splash_imports.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/splash", module: SplashModule());
  }
}
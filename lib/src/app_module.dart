import 'package:mcs/src/app_imports.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/splash", module: SplashModule());
    r.module("/auth", module: AuthModule());
    r.module("/home", module: HomeModule());
    r.module("/script", module: ScriptModule());
  }
}

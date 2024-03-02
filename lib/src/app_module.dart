import 'package:mcs/src/app_imports.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/splash", module: SplashModule());
    r.module("/auth", module: AuthModule());
    r.module("/script", module: ScriptModule());
  }
  
  @override
  void exportedBinds(Injector i) {
    super.binds(i);
    i.addSingleton<ISSHClientService>(AppSSH.new);
    // i.addSingleton<ISSHClientService>(SSHClientService.new);
  }
}

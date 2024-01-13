import 'package:mcs/src/imports.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const AuthPage());
  }
  @override
  void binds(Injector i) {
    i.addLazySingleton(AuthController.new);
  }
}
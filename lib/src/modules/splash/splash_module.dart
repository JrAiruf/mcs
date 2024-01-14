import 'package:mcs/src/imports.dart';
export '../splash/splash_imports.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const SplashPage());
  }
}

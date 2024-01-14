import 'package:mcs/src/app_imports.dart';
export '../splash/splash_imports.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const SplashPage());
  }
}

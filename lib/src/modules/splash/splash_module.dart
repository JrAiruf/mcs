import 'package:mcs/src/imports.dart';
import 'package:mcs/src/modules/splash/views/splash_page.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
r.child("/", child: (_) => const SplashPage());
  }
}
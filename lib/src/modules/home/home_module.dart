import 'package:mcs/src/app_imports.dart';
export '../home/home_imports.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomePage());
  }
}

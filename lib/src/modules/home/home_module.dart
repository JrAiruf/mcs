import 'package:mcs/src/imports.dart';
import 'package:mcs/src/modules/home/presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
r.child("/", child: (_)=> const HomePage());
  }
}
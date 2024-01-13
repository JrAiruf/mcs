import 'package:mcs/src/imports.dart';

class ScriptModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const ScriptPage());
  }
}
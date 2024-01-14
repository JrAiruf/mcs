import 'package:mcs/src/imports.dart';
export 'package:mcs/src/modules/script/script_imports.dart';

class ScriptModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const ScriptPage());
  }
}
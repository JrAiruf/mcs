import 'package:mcs/src/app_imports.dart';
export 'package:mcs/src/modules/script/script_imports.dart';

class ScriptModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const ScriptPage());
  }

  @override
  void binds(Injector i) async {
    i.addInstance(await SharedPreferences.getInstance());
    i.addLazySingleton<IScriptDatasource>(ScriptDatasource.new);
    i.addLazySingleton<IScriptRepository>(ScriptRepository.new);
    i.addLazySingleton(SaveScript.new);
    i.addLazySingleton(FetchScriptsList.new);
    i.addLazySingleton(SaveScriptBloc.new);
    i.addLazySingleton(FetchScriptsListBloc.new);
    i.addLazySingleton<ScriptController>(ScriptController.new);
  }
}

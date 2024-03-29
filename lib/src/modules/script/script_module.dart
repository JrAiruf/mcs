import 'package:mcs/src/app_imports.dart';
export 'package:mcs/src/modules/script/script_imports.dart';

class ScriptModule extends Module {
  
  @override
  List<Module> get imports => [
    AppModule(),
    AuthModule(),
  ];
  @override
  void binds(Injector i) {
    i.addLazySingleton<IScriptDatasource>(ScriptDatasource.new);
    i.addLazySingleton<IScriptRepository>(ScriptRepository.new);
    i.addLazySingleton(SaveScript.new);
    i.addLazySingleton(ExecuteScript.new);
    i.addLazySingleton(UpdateScript.new);
    i.addLazySingleton(RemoveScript.new);
    i.addLazySingleton(FetchScriptsList.new);
    i.addLazySingleton(ScriptBloc.new);
    i.addLazySingleton(FetchScriptsListBloc.new);
    i.addLazySingleton(ScriptController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomePage());
    r.child("/script_page", child: (_) => const ScriptPage());
  }
}

import 'package:mcs/src/app_imports.dart';
export 'package:mcs/src/modules/auth/auth_imports.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const AuthPage());
  }
  @override
  void binds(Injector i) {
    i.addLazySingleton<ISSHClientService>(SSHClientService.new);
    i.addLazySingleton<ISSHAuthDatasource>(SSHAuthDatasource.new);
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);
    i.addLazySingleton(AuthBloc.new);
    i.addLazySingleton(AuthController.new);
  }
}
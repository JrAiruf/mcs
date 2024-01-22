import 'package:mcs/src/app_imports.dart';

class Login {
  Login(IAuthRepository repository) : _repository = repository;
  final IAuthRepository _repository;
  Future<Either<AuthException, AuthEntity>> call(AuthEntity? entity) async => _repository.authenticate(entity);
}

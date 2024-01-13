import 'package:dartz/dartz.dart';
import 'package:mcs/src/imports.dart';
import 'package:mcs/src/modules/auth/infra/interfaces/iauth_repository.dart';

class Login {
  Login(IAuthRepository repository) : _repository = repository;
  final IAuthRepository _repository;
  Future<Either<AuthException, AuthEntity>> call(AuthEntity entity) async => _repository.authenticate(entity);
}

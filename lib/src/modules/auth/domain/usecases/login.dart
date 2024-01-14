import 'package:dartz/dartz.dart';
import 'package:mcs/src/imports.dart';

class Login {
  Login(IAuthRepository repository) : _repository = repository;
  final IAuthRepository _repository;
  Future<Either<AuthException, AuthEntity>> call(AuthEntity entity) async => _repository.authenticate(entity);
}

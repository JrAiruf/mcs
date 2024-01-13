import 'package:dartz/dartz.dart';
import 'package:mcs/src/imports.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, AuthEntity>> authenticate(AuthEntity? entity);
}

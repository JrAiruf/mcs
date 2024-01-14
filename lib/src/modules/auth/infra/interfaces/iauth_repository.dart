import 'package:mcs/src/imports.dart';

abstract interface class IAuthRepository {
  Future<Either<AuthException, AuthEntity>> authenticate(AuthEntity? entity);
}

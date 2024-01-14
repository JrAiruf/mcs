import 'package:mcs/src/app_imports.dart';

abstract interface class IAuthRepository {
  Future<Either<AuthException, AuthEntity>> authenticate(AuthEntity? entity);
}

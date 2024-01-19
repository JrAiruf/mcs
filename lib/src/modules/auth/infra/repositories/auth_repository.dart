import 'package:mcs/src/app_imports.dart';

final class AuthRepository implements IAuthRepository {
  AuthRepository(IAuthDatasource datasource) : _datasource = datasource;
  final IAuthDatasource _datasource;
  @override
  Future<Either<AuthException, AuthEntity>> authenticate(AuthEntity? entity) async {
    try {
      final adaptedEntity = AuthEntityAdapter.toAdapter(entity!).toMap();
      final result = await _datasource.authenticate(adaptedEntity);
      if (result.isNotEmpty) {
        final authEntity = AuthEntityAdapter.toEntity(result);
        return right(authEntity);
      } else {
        return left(AuthException("Não foi possível realizar login."));
      }
    } on BaseException catch (e) {
      return left(AuthException(e.message));
    }
  }

  @override
  Future<Either<AuthException, bool>> signOut() async {
    try {
      final result = await _datasource.signOut();
      return right(result);
    } on BaseException catch (e) {
      return left(AuthException(e.message));
    }
  }
}

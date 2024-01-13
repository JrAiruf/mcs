import 'package:dartz/dartz.dart';
import 'package:mcs/src/imports.dart';

final class AuthRepository implements IAuthRepository {
  AuthRepository(ISSHAuthDatasource datasource) : _datasource = datasource;
  final ISSHAuthDatasource _datasource;
  @override
  Future<Either<AuthException, AuthEntity>> authenticate(AuthEntity? entity) async {
    try {
      final adaptedEntity = AuthEntityAdapter.toAdapter(entity!).toMap();
      final result = await _datasource.authenticate(adaptedEntity);
      if (result.isNotEmpty) {
        final authEntity = AuthEntityAdapter.toEntity(result);
        return right(authEntity);
      } else {
        return left(AuthException("Não foi possível realizar login"));
      }
    } on BaseException catch (e) {
      return left(AuthException(e.message));
    }
  }
}

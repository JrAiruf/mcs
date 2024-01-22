import 'package:mcs/src/app_imports.dart';

class SignOut {
  SignOut(IAuthRepository repository) : _repository = repository;
  final IAuthRepository _repository;
  Future<Either<AuthException, bool>> call() async => _repository.signOut();
}

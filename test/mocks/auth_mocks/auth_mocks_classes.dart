import 'package:mcs/src/modules/auth/auth_imports.dart';
import 'package:mocktail/mocktail.dart';

final class AuthRepositoryMock extends Mock implements IAuthRepository {}
final class AuthDatasourceMock extends Mock implements ISSHAuthDatasource {}

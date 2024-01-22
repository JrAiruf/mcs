import 'package:mcs/src/app_imports.dart';

final class SSHClientServiceMock extends Mock implements ISSHClientService {}

final class AuthDatasourceMock extends Mock implements IAuthDatasource {}

final class AuthRepositoryMock extends Mock implements IAuthRepository {}

final class LoginMock extends Mock implements Login {}
final class SignOutMock extends Mock implements SignOut {}

final class AuthBlocMock extends MockBloc<AuthEvents, AuthStates> implements AuthBloc {}

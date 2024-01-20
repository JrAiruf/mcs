import 'package:mcs/src/app_imports.dart';

void main() {
  late IAuthRepository repository;
  late SignOut signOut;
  setUp(
    () {
      repository = AuthRepositoryMock();
      signOut = SignOut(repository);
    },
  );
  group(
    "SignOut should",
    () {
      test("call repository for log off from application", () async {
        when(() => repository.signOut()).thenAnswer((_) async => const Right(true));
        final result = await signOut();
        expect(result.fold((l) => null, (r) => r), isA<bool>());
        expect(result.fold((l) => null, (r) => r), equals(true));
      });
      test("emit an AuthException due fail to signOut", () async {
        when(() => repository.signOut()).thenAnswer((_) async => Left(AuthException("Algum erro ocorreu.")));
        final result = await signOut();
        expect(result.fold((l) => l, (r) => null), isA<AuthException>());
        expect(result.fold((l) => l.message, (r) => null), equals("Algum erro ocorreu."));
      });
    },
  );
}

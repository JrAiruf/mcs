import 'package:mcs/src/app_imports.dart';

void main() {
  late AuthBlocMock authBloc;
  setUp(
    () {
      authBloc = AuthBlocMock();
    },
  );
  group(
    "AuthBloc should",
    () {
      test("emit a AuthSuccessState", () async {
        whenListen(
          authBloc,
          Stream.fromIterable([
            AuthLoadingState(),
            AuthSuccessState(AuthMockData.authEntity),
          ]),
          initialState: AuthInitialState(),
        );

        expect(authBloc.state, isA<AuthInitialState>());

        await expectLater(
            authBloc.stream,
            emitsInOrder([
              isA<AuthLoadingState>(),
              isA<AuthSuccessState>(),
            ]));

        expect(authBloc.state, isA<AuthSuccessState>());
      });
      test("emit a AuthSignOutState", () async {
        whenListen(
          authBloc,
          Stream.fromIterable([
            AuthLoadingState(),
            AuthSignOutState(),
          ]),
          initialState: AuthInitialState(),
        );

        expect(authBloc.state, isA<AuthInitialState>());

        await expectLater(
            authBloc.stream,
            emitsInOrder([
              isA<AuthLoadingState>(),
              isA<AuthSignOutState>(),
            ]));

        expect(authBloc.state, isA<AuthSignOutState>());
      });
    },
  );
}

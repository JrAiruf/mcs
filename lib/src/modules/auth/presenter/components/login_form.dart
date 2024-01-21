import '../../../../app_imports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.height, this.width});

  final double? height;
  final double? width;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

final _controller = Modular.get<AuthController>();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 350,
      width: widget.width ?? double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _controller.authKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFieldLabel(label: "Username"),
                AppTextField(
                  controller: _controller.username,
                  validator: fieldValidator,
                ),
                const TextFieldLabel(label: "Password"),
                AppTextField(
                    controller: _controller.password,
                    visible: !_controller.visiblePassword,
                    passwordField: true,
                    validator: fieldValidator,
                    iconTap: () {
                      setState(
                        () {
                          _controller.visiblePassword = !_controller.visiblePassword;
                        },
                      );
                    }),
              ],
            ),
          ),
          const SizedBox(height: 25),
          BlocConsumer(
            bloc: _controller.authBloc,
            listener: (context, state) {
              if (state is AuthFailureState) {
                _controller.authSnackbar(context, state.message);
              }
              if (state is AuthSuccessState) {
                Modular.to.navigate("/script/", arguments: state.authEntity);
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: AppThemes.contrastColor),
                );
              }
              return AppButton(
                onTap: _controller.authenticate,
                text: "Login",
                backgroundColor: AppThemes.secondaryColor,
                primaryColor: AppThemes.contrastColor,
              );
            },
          ),
        ],
      ),
    );
  }
}

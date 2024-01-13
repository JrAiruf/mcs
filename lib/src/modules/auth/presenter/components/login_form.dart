import '../../../../imports.dart';

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
          AppTextField(
            label: "Username",
            onChanged: _controller.authEntity.setUsername,
          ),
          const SizedBox(height: 25),
          AppTextField(
              visible: !_controller.visiblePassword,
              label: "Password",
              onChanged: _controller.authEntity.setUsername,
              passwordField: true,
              onTap: () {
                setState(
                  () {
                    _controller.visiblePassword = !_controller.visiblePassword;
                  },
                );
              }),
          const SizedBox(height: 25),
          AppButton(
            onTap: () => Modular.to.navigate("/home/"),
            text: "Login",
            backgroundColor: AppThemes.secondaryColor,
            primaryColor: AppThemes.contrastColor,
          ),
        ],
      ),
    );
  }
}

import 'package:mcs/src/modules/splash/splash_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Modular.to.navigate("/auth/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppThemes.primaryColor,
        height: double.infinity,
        width: double.infinity,
        child: const LogoComponent()
      ),
    );
  }
}

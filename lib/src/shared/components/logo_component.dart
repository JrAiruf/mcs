import 'package:mcs/src/imports.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "MSC",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Text(
            "MC SSH Client",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

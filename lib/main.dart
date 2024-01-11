import 'package:mcs/src/app_module.dart';
import 'package:mcs/src/imports.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

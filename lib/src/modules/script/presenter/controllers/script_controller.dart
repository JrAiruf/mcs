import 'package:mcs/src/app_imports.dart';

final class ScriptController {
  final scriptBloc = Modular.get<SaveScriptBloc>();
  Script script = Script();
}

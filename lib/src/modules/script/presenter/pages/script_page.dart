import '../../../../app_imports.dart';

class ScriptPage extends StatefulWidget {
  const ScriptPage({super.key});
  @override
  State<ScriptPage> createState() => _ScriptPageState();
}

final _controller = Modular.get<ScriptController>();

class _ScriptPageState extends State<ScriptPage> {
  @override
  void initState() {
    super.initState();
    _controller.script = Modular.args.data;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppThemes.primaryColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScriptDescriptionComponent(controller: _controller),
                SizedBox(height: height * 0.045),
                const AppButton(
                  backgroundColor: AppThemes.secondaryColor,
                  text: "Executar Script",
                  primaryColor: AppThemes.contrastColor,
                ),
                const SizedBox(height: 20),
                const AppButton(
                  backgroundColor: AppThemes.contrastColor,
                  text: "Remover Script",
                  primaryColor: AppThemes.secondaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

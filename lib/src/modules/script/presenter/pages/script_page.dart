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
                BlocConsumer(
                  bloc: _controller.scriptBloc,
                  listener: (_, state) {
                    if (state is ExecuteScriptSuccessState) {
                      Modular.to.pop();
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      backgroundColor: AppThemes.secondaryColor,
                      text: "Executar Script",
                      onTap: () => _controller.executeScript(context),
                      primaryColor: AppThemes.contrastColor,
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer(
                  bloc: _controller.scriptBloc,
                  listener: (_, state) {
                    if (state is RemoveScriptSuccessState) {
                      Modular.to.pop();
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      backgroundColor: AppThemes.contrastColor,
                      text: "Remover Script",
                      onTap: () => _controller.removeScript(context),
                      primaryColor: AppThemes.secondaryColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            ScriptDescriptionComponent(controller: _controller),
            SizedBox(height: height * 0.045),
            BlocConsumer(
              bloc: _controller.scriptBloc,
              listener: (_, state) {
                if (state is ExecuteScriptSuccessState) {
                  Modular.to.pop();
                }
                if (state is RemoveScriptSuccessState) {
                  Modular.to.pop();
                }
              },
              builder: (context, state) {
                if (state is ScriptExecutionLoadingState) {
                  return SizedBox(
                    height:height * 0.15,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: AppThemes.contrastColor ,),
                        SizedBox(height: 20),
                        Text(
                          "Em execução ...",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    AppButton(
                      backgroundColor: AppThemes.secondaryColor,
                      text: "Executar Script",
                      onTap: () => _controller.executeScript(context),
                      primaryColor: AppThemes.contrastColor,
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      backgroundColor: AppThemes.contrastColor,
                      text: "Remover Script",
                      onTap: () => _controller.removeScript(context),
                      primaryColor: AppThemes.secondaryColor,
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

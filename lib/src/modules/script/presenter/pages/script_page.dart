import '../../../../app_imports.dart';

class ScriptPage extends StatefulWidget {
  const ScriptPage({super.key});

  @override
  State<ScriptPage> createState() => _ScriptPageState();
}

Script _script = Modular.args.data;

class _ScriptPageState extends State<ScriptPage> {
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
                SizedBox(height: height * 0.045),
                Text(
                  "${_script.name}",
                  style: const TextStyle(
                    color: AppThemes.contrastColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: height * 0.045),
                Text(
                  "${_script.command}",
                  style: const TextStyle(
                    color: AppThemes.contrastColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: height * 0.045),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldLabel(label: "Descrição"),
                    AppTextField(),
                    const SizedBox(height: 20),
                    const AppButton(
                      backgroundColor: AppThemes.secondaryColor,
                      text: "Adicionar Descrição",
                      primaryColor: AppThemes.contrastColor,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Descrição",
                      style: TextStyle(
                        color: AppThemes.contrastColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppThemes.contrastColor,
                          width: 0.3,
                        ),
                      ),
                      child: _script.description.isEmpty
                          ? const Center(
                              child: Text(
                                "Esse Script não possui descrição",
                                style: TextStyle(
                                  color: AppThemes.contrastColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                _script.description,
                                style: const TextStyle(
                                  color: AppThemes.contrastColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
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

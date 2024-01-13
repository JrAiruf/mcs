import '../../../../imports.dart';

class ScriptPage extends StatefulWidget {
  const ScriptPage({super.key});

  @override
  State<ScriptPage> createState() => _ScriptPageState();
}

class _ScriptPageState extends State<ScriptPage> {
  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Username",
                      style: TextStyle(
                        color: AppThemes.contrastColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        size: 35,
                        color: AppThemes.contrastColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: AppThemes.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextFieldLabel(label: "Nome do Script"),
                          AppTextField(),
                          const TextFieldLabel(label: "Comando Script"),
                          AppTextField(),
                          const SizedBox(height: 20),
                          const AppButton(
                            backgroundColor: AppThemes.primaryColor,
                            text: "Salvar Script",
                            primaryColor: AppThemes.contrastColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Meus Scripts",
                  style: TextStyle(
                    color: AppThemes.contrastColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:[]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import '../../../../app_imports.dart';

class CreateScriptForm extends StatelessWidget {
  const CreateScriptForm({super.key, required this.controller});

  final ScriptController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppThemes.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Form(
            key: controller.createScriptKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFieldLabel(label: "Nome do Script"),
                AppTextField(
                  controller: controller.scriptName,
                  validator: fieldValidator,
                ),
                const TextFieldLabel(label: "Comando Script"),
                AppTextField(
                  controller: controller.scriptCommand,
                  validator: fieldValidator,
                ),
                const SizedBox(height: 20),
                AppButton(
                  onTap: controller.saveScript,
                  backgroundColor: AppThemes.primaryColor,
                  text: "Salvar Script",
                  primaryColor: AppThemes.contrastColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

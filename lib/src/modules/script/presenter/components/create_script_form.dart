import '../../../../app_imports.dart';

class CreateScriptForm extends StatelessWidget {
  const CreateScriptForm({super.key});

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
    );
  }
}

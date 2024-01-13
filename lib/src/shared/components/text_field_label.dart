import '../../imports.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({required this.label, super.key});

final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        label,
        style: const TextStyle(
          color: AppThemes.contrastColor,
          fontWeight: FontWeight.w300,
          fontSize: 13,
        ),
      ),
    );
  }
}

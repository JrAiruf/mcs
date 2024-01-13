// ignore_for_file: must_be_immutable
import '../../imports.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.label,
    this.onChanged,
    this.visible,
    this.passwordField,
    this.onTap,
  });
  String? label;
  bool? visible;
  bool? passwordField;
  Function(String)? onChanged;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: visible ?? false,
        style: const TextStyle(color: AppThemes.contrastColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label ?? ""),
          labelStyle: const TextStyle(
            color: AppThemes.contrastColor,
            fontWeight: FontWeight.w300,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppThemes.contrastColor, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppThemes.contrastColor, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: passwordField ?? false
              ? IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    visible ?? false ? Icons.visibility : Icons.visibility_off,
                    color: AppThemes.contrastColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

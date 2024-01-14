import '../../app_imports.dart';
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.icon,
    this.elevation,
    this.onTap,
    this.primaryColor,
    this.height,
    this.width,
    this.text,
    this.showBorder,
    this.backgroundColor,
  });

  final IconData? icon;
  final Function()? onTap;
  final Color? primaryColor;
  final Color? backgroundColor;
  final String? text;
  final bool? showBorder;
  final double? elevation;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(side: BorderSide(color: backgroundColor ?? Colors.white),
          elevation: elevation,
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon, color: primaryColor) : Container(),
            icon != null ? SizedBox(width: width ?? double.infinity * 0.02) : Container(),
            Text(
              text ?? "",
              style: TextStyle(color: primaryColor,fontSize: 20,fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
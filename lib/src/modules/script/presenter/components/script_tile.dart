import 'package:mcs/src/app_imports.dart';

class ScriptTile extends StatelessWidget {
  const ScriptTile({Key? key, required this.script, this.onTap, this.height}) : super(key: key);

  final Script script;
  final Function()? onTap;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppThemes.primaryColor, width: 0.3),
              color: AppThemes.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: height,
            width: MediaQuery.sizeOf(context).width * 0.46,
            child: Center(
              child: Text(
                script.name ?? "",
                style: const TextStyle(
                  color: AppThemes.contrastColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Container(
            height: height,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              border: Border.all(color: AppThemes.secondaryColor, width: 0.3),
              color: script.activated ?? false ? AppThemes.activeColor : AppThemes.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

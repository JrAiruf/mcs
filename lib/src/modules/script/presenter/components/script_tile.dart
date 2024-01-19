// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      child: Container(
        decoration: BoxDecoration(
          color: AppThemes.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: MediaQuery.sizeOf(context).width * 0.44,
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
    );
  }
}

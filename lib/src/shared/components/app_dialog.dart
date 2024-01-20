import 'package:mcs/src/app_imports.dart';

Dialog appDialog(
  BuildContext context,
  String dialogTitle,
  String message,
  Function() onAccept,
  Function() onDismiss,
) {
  final height = MediaQuery.sizeOf(context).height;
  return Dialog(
    backgroundColor: AppThemes.secondaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: SizedBox(
      height: height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  dialogTitle,
                  style: const TextStyle(
                    color: AppThemes.contrastColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: const TextStyle(
                    color: AppThemes.contrastColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: AppButton(
                  height: 40,
                  backgroundColor: AppThemes.primaryColor,
                  primaryColor: AppThemes.contrastColor,
                  text: "SIM",
                  onTap: onAccept,
                ),
              ),
              Expanded(
                flex: 1,
                child: AppButton(
                  height: 40,
                  backgroundColor: AppThemes.primaryColor,
                  primaryColor: AppThemes.contrastColor,
                  text: "NÃO",
                  onTap: onDismiss,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

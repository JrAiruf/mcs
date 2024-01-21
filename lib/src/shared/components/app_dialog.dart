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
      height: height * 0.25,
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
                child: InkWell(
                  onTap: onAccept,
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 0.5,
                          color: AppThemes.contrastColor,
                        ),
                      ),
                      color: AppThemes.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "SIM",
                        style: TextStyle(
                          color: AppThemes.contrastColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: onDismiss,
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppThemes.contrastColor,
                        ),
                      ),
                      color: AppThemes.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "NÃO",
                        style: TextStyle(
                          color: AppThemes.contrastColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

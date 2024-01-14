import '../../../../app_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
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
                SizedBox(height: height * 0.04),
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
                const CreateScriptForm(),
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
                    children: _scriptNames
                        .map((e) => InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppThemes.secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 75,
                                width: MediaQuery.sizeOf(context).width * 0.44,
                                child: Center(
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: AppThemes.contrastColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _scriptNames = [
  "Script 1",
  "Script 2",
  "Script 3",
  "Script 4",
  "Script 5",
  "Script 6",
  "Script 7",
  "Script 8",
  "Script 9",
  "Script 10",
  "Script 11",
  "Script 12",
  "Script 13",
];

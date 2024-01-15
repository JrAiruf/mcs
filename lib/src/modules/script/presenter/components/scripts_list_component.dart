import 'package:mcs/src/app_imports.dart';

class ScriptsListComponent extends StatelessWidget {
  ScriptsListComponent({super.key, required this.controller}) {
    controller.fetchScriptsList();
  }

  final ScriptController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: controller.fetchScriptsListBloc,
      builder: (context, state) {
        if (state is FetchScriptsListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppThemes.contrastColor,
            ),
          );
        }
        if (state is FetchScriptsListFailureState) {
          return SizedBox(height: 350,
            child: Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  color: AppThemes.contrastColor,
                ),
              ),
            ),
          );
        }
        if (state is FetchScriptsListSuccessState) {
          return Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: state.scripts
                  .map((script) => InkWell(
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
                              script.name ?? "",
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
          );
        }
        return Container();
      },
    );
  }
}

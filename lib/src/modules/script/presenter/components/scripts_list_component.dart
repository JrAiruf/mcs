import 'package:mcs/src/app_imports.dart';
import 'package:mcs/src/modules/script/presenter/components/script_tile.dart';

class ScriptsListComponent extends StatelessWidget {
  const ScriptsListComponent({super.key, required this.controller});

  final ScriptController controller;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return BlocBuilder(
      bloc: controller.fetchScriptsListBloc,
      builder: (context, state) {
        if (state is FetchScriptsListLoadingState) {
          return const SizedBox(
            height: 350,
            child: Center(
              child: CircularProgressIndicator(
                color: AppThemes.contrastColor,
              ),
            ),
          );
        }
        if (state is FetchScriptsListFailureState) {
          return SizedBox(
            height: 350,
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
          return SizedBox(
            height: height * 0.54,
            child: Center(
              child: state.scripts.isEmpty
                  ? const Text(
                      "Não existem scripts salvos!",
                      style: TextStyle(
                        color: AppThemes.contrastColor,
                      ),
                    )
                  : GridView.builder(
                      itemCount: state.scripts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: height * 0.1,
                        crossAxisSpacing: width * 0.02,
                        mainAxisSpacing: height * 0.01,
                      ),
                      itemBuilder: (_, i) {
                        final script = state.scripts[i];
                        print(script.activated);
                        return ScriptTile(
                          script: script,
                          onTap: () {
                            Modular.to.pushNamed('./script_page', arguments: script);
                          },
                        );
                      },
                    ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

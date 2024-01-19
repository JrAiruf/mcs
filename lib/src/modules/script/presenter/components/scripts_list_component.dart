import 'package:mcs/src/app_imports.dart';
import 'package:mcs/src/modules/script/presenter/components/script_tile.dart';

class ScriptsListComponent extends StatelessWidget {
  const ScriptsListComponent({super.key, required this.controller});

  final ScriptController controller;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
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
          return Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: state.scripts
                  .map(
                    (script) => ScriptTile(
                      script: script,
                      height: height * 0.09,
                      onTap: () {
                        Modular.to.pushNamed('./script_page',arguments: script);
                      },
                    ),
                  )
                  .toList(),
            ),
          );
        }
        return Container();
      },
    );
  }
}

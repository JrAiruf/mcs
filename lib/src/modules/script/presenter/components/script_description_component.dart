// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mcs/src/app_imports.dart';

class ScriptDescriptionComponent extends StatefulWidget {
  const   ScriptDescriptionComponent({Key? key, required this.controller}) : super(key: key);
  final ScriptController controller;
  @override
  State<ScriptDescriptionComponent> createState() => _ScriptDescriptionComponentState();
}

class _ScriptDescriptionComponentState extends State<ScriptDescriptionComponent> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Form(
      key: widget.controller.updateScriptKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.045),
          Text(
            "${widget.controller.script.name}",
            style: const TextStyle(
              color: AppThemes.contrastColor,
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: height * 0.045),
          Text(
            "${widget.controller.script.command}",
            style: const TextStyle(
              color: AppThemes.contrastColor,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: height * 0.045),
          const TextFieldLabel(label: "Descrição"),
          AppTextField(
            maxLines: 3,
            controller: widget.controller.scriptDescription,
          ),
          const SizedBox(height: 20),
          AppButton(
            onTap: widget.controller.updateScript,
            backgroundColor: AppThemes.secondaryColor,
            text: "Adicionar Descrição",
            primaryColor: AppThemes.contrastColor,
          ),
          const SizedBox(height: 20),
          const Text(
            "Descrição",
            style: TextStyle(
              color: AppThemes.contrastColor,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder(
              bloc: widget.controller.scriptBloc,
              builder: (_, state) {
                if (state is ScriptLoadingState) {
                  return Container(
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppThemes.contrastColor,
                        width: 0.3,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: LinearProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (state is UpdateScriptSuccessState) {
                  return Container(
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppThemes.contrastColor,
                        width: 0.3,
                      ),
                    ),
                    child: widget.controller.script.description.isEmpty
                        ? const Center(
                            child: Text(
                              "Esse Script não possui descrição",
                              style: TextStyle(
                                color: AppThemes.contrastColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                widget.controller.script.description,
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
                return Container(
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppThemes.contrastColor,
                      width: 0.3,
                    ),
                  ),
                  child: widget.controller.script.description.isEmpty
                      ? const Center(
                          child: Text(
                            "Esse Script não possui descrição",
                            style: TextStyle(
                              color: AppThemes.contrastColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              widget.controller.script.description,
                              style: const TextStyle(
                                color: AppThemes.contrastColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                );
              }),
        ],
      ),
    );
  }
}

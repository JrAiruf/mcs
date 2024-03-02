// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mcs/src/app_imports.dart';

class ScriptExecutionAdapter {
  Script? script;
  String? executionLog;

  ScriptExecutionAdapter({
    this.script,
    this.executionLog,
  });

  static ScriptExecution fromMap(Map<String, dynamic> map) {
    return ScriptExecution(
      script: ScriptAdapter.fromMap(map['script'] as Map<String, dynamic>),
      executionLog: map['executionLog'] as String,
    );
  }
}

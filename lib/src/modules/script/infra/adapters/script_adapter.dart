import 'package:mcs/src/app_imports.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScriptAdapter {
  String? name;
  String? command;
  String? description;

  ScriptAdapter({
    this.name,
    this.command,
    this.description,
  });

  static Script fromMap(Map<String, dynamic> map) {
    return Script(
      name: map['name'],
      command: map['command'],
      description: map['description'],
    );
  }

  static Map<String, dynamic> toMap(Script entity) {
    return <String, dynamic>{
      'name': entity.name,
      'command': entity.command,
      'description': entity.description,
    };
  }
}

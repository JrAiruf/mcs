import 'package:mcs/src/app_imports.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScriptAdapter {
  String? id;
  String? name;
  String? command;
  String? description;
  bool? activated;

  ScriptAdapter({
    this.id,
    this.name,
    this.command,
    this.description,
    this.activated,
  });

  static Script fromMap(Map<String, dynamic> map) {
    return Script(
      id: map['id'],
      name: map['name'],
      command: map['command'],
      description: map['description'],
      activated: map['activated'],
    );
  }

  static Map<String, dynamic> toMap(Script entity) {
    return <String, dynamic>{
      'id': entity.id,
      'name': entity.name,
      'command': entity.command,
      'description': entity.description,
      'activated': entity.activated,
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Script {
  String? name;
  String? command;
  String? description;

  Script({
    this.name,
    this.command,
    this.description,
  });

  
  void setName(String? value) {
    if (value != null && value.isNotEmpty) {
      name = value;
    } else {
      value = null;
    }
  }

  void setCommand(String? value) {
    if (value != null && value.isNotEmpty) {
      command = value;
    } else {
      value = null;
    }
  }

  void setDescription(String? value) {
    if (value != null && value.isNotEmpty) {
      description = value;
    } else {
      value = null;
    }
  }
}

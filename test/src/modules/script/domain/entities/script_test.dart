import 'package:mcs/src/app_imports.dart';

void main() {
  late Script script;
  setUp(
    () {
      script = Script(
        name: null,
        command: null,
      );
    },
  );
  group(
    "SetName Function should",
    () {
      test(
        "assign the given value to name property",
        () {
          script.setName("Script 1");
          expect(script.name, equals("Script 1"));
        },
      );
      test(
        "assign no value to name property",
        () {
          script.setName("");
          expect(script.name, equals(null));
        },
      );
    },
  );
  group(
    "SetCommand Function should",
    () {
      test(
        "assign the given value to command property",
        () {
          script.setCommand("scriptCommand");
          expect(script.command, equals("scriptCommand"));
        },
      );
      test(
        "assign no value to command property",
        () {
          script.setDescription("");
          expect(script.command, equals(null));
        },
      );
    },
  );
  test(
    "assign the given value to description property",
    () {
      script.setDescription("scriptDescription");
      expect(script.description, equals("scriptDescription"));
    },
  );
}

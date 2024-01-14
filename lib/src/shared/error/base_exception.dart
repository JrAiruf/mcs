import 'package:mcs/src/app_imports.dart';

abstract class BaseException implements Exception {
  BaseException(this.message) {
    _showExceptionMessage(message);
  }
  
  final String message;

  _showExceptionMessage(String exception) {
    FlutterError.presentError(FlutterErrorDetails(exception: exception));
  }
}

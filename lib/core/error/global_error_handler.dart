import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlobalErrorHandler {
  GlobalErrorHandler._();

  static void initialize() {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      _log(details.exception, details.stack);
    };

    ErrorWidget.builder = (details) {
      _log(details.exception, null);
      return const Material(
        color: Colors.white,
        child: Center(child: Text('Something went wrong.')),
      );
    };
  }

  static void handleZoneError(Object error, StackTrace stackTrace) {
    _log(error, stackTrace);
  }

  static void _log(Object error, StackTrace? stackTrace) {
    if (kDebugMode) {
      debugPrint('GlobalErrorHandler: $error');
      if (stackTrace != null) {
        debugPrint('$stackTrace');
      }
    }
  }
}

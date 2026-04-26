import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AppSnackbar {
  AppSnackbar._();

  static void show(String message, {SnackBarBehavior? behavior}) {
    final messenger = rootScaffoldMessengerKey.currentState;
    if (messenger == null) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: behavior ?? SnackBarBehavior.floating,
        ),
      );
  }
}

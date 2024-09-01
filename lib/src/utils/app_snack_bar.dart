import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String msg) {
  final SnackBar snackBar = SnackBar(
    content: Text(msg),
    duration: const Duration(seconds: 5),
    padding: const EdgeInsets.all(10.0),
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

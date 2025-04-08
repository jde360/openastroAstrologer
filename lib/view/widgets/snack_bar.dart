import 'package:flutter/material.dart';

void showSnackbar({required String message, required BuildContext context}) {
  var snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

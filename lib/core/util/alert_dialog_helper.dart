import 'package:flutter/material.dart';

class AlertDialogHelper {
  static showAlert(BuildContext context, String message) {
    showDialog(context: context, builder: (context) => Text(message));
  }
}

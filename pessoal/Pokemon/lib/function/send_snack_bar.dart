import 'package:flutter/material.dart';

//criando function sendsnackbar

void sendSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}

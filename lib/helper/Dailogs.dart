// ignore: file_names
import 'package:flutter/material.dart';

class Dialogue {
  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.purple.shade300.withOpacity(.5),
      duration: const Duration(milliseconds: 2000),
    ));
  }

  static void showIndicator(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()));
  }
}

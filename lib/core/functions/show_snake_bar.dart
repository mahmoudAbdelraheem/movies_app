import 'package:flutter/material.dart';

void showSnackBar(
  String text,
  Color textColor,
  Color backgroundColor,
  BuildContext context,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        text,
        style: TextStyle(color: textColor),
        // 'Account Created Successfly, Let\'s sing in know.',
      ),
    ),
  );
}

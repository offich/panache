import 'package:flutter/material.dart';
import 'package:panache/src/ui/style/color.dart';
import 'package:panache/src/ui/style/text.dart';

showSnackBar(BuildContext context, String text, {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    PanacheSnackBar(text: text, isError: isError),
  );
}

class PanacheSnackBar extends SnackBar {
  final String text;
  final bool isError;

  PanacheSnackBar({super.key, required this.text, this.isError = false})
      : super(
          backgroundColor:
              isError ? PanacheColor.errorColor : PanacheColor.primaryColor,
          width: 360.0,
          content: Text(
            text,
            style: PanacheTextStyle.medium.copyWith(color: Colors.black),
          ),
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
        );
}

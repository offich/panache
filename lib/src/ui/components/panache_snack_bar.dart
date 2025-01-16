import 'package:flutter/material.dart';
import 'package:panache/src/ui/style/color.dart';
import 'package:panache/src/ui/style/text.dart';

showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(PanacheSnackBar());
}

class PanacheSnackBar extends SnackBar {
  PanacheSnackBar({super.key})
      : super(
          backgroundColor: PanacheColor.primaryColor,
          width: 360.0,
          content: Text(
            "Copied Text!!",
            style: PanacheTextStyle.medium.copyWith(color: Colors.black),
          ),
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
        );
}

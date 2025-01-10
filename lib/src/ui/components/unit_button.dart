import 'package:flutter/material.dart';
import 'package:panache/src/model/unit.dart';

class UnitButton extends StatelessWidget {
  const UnitButton({super.key, required this.unit, required this.onPressed});

  final Unit unit;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      child: Text(unit.text),
    );
  }
}

import 'package:flutter/material.dart';

class LoremText extends StatelessWidget {
  final String text;

  const LoremText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

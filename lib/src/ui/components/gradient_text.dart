import 'package:flutter/material.dart';
import 'package:panache/src/ui/style/color.dart';
import 'package:panache/src/ui/style/text.dart';

class GradientText extends StatelessWidget {
  final String text;

  const GradientText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            PanacheColor.secondaryColor,
            PanacheColor.primaryColor,
            Color.fromRGBO(48, 133, 195, 1.0),
            PanacheColor.thirdlyColor,
          ],
        ).createShader(bounds);
      },
      child: Stack(
        children: <Widget>[
          // just stroke for light mode
          Text(
            text,
            style: PanacheTextStyle.largeBold.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Colors.black,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: PanacheTextStyle.largeBold.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

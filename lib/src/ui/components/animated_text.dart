import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/ui/style/color.dart';
import 'package:panache/src/ui/style/text.dart';

class AnimatedText extends HookWidget {
  final String text;

  const AnimatedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final opacityAnimation = useState<Animation<double>?>(null);
    final offsetAnimation = useState<Animation<Offset>?>(null);

    useEffect(() {
      opacityAnimation.value = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn,
        ),
      );

      offsetAnimation.value =
          Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
      );

      animationController.forward();

      return;
    }, []);

    useEffect(() {
      animationController.forward(from: 0.0);

      return;
    }, [text]);

    if (offsetAnimation.value == null || opacityAnimation.value == null) {
      return SizedBox.shrink();
    }

    return SlideTransition(
      position: offsetAnimation.value!,
      child: FadeTransition(
        opacity: opacityAnimation.value!,
        child: Theme(
          data: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: PanacheColor.primaryColor.withValues(alpha: 0.1),
            ),
          ),
          child: SelectableText(text, style: PanacheTextStyle.medium),
        ),
      ),
    );
  }
}

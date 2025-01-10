import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/unit.dart';

class UnitButton extends HookWidget {
  const UnitButton({
    super.key,
    required this.unit,
    required this.onPressed,
  });

  final Unit unit;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final isFocused = useState(false);

    useEffect(() {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          focusNode.requestFocus();
        }

        isFocused.value = focusNode.hasFocus;
      });

      return;
    }, []);

    return Container(
      decoration: isFocused.value
          ? ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 4, color: Colors.indigo),
                borderRadius: BorderRadius.circular(25),
              ),
            )
          : null,
      child: ElevatedButton(
        focusNode: focusNode,
        onPressed: () {
          onPressed();
          focusNode.requestFocus();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(unit.text),
      ),
    );
  }
}

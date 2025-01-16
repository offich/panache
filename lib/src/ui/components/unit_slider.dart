import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/unit.dart';
import 'package:panache/src/ui/style/color.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class UnitSlider extends HookWidget {
  final Unit unit;
  final int unitNum;
  final Function(int) onChanged;

  const UnitSlider({
    required this.unit,
    required this.unitNum,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final isFocused = useState(false);

    useEffect(() {
      focusNode.addListener(() {
        isFocused.value = focusNode.hasFocus;
      });

      return;
    }, []);

    return Focus(
      focusNode: focusNode,
      child: SfSliderTheme(
        data: SfSliderThemeData(
          activeTrackColor: unitNum > 0
              ? PanacheColor.secondaryColor
              : PanacheColor.errorColor,
          inactiveTrackColor: unitNum > 0
              ? PanacheColor.secondaryColor
              : PanacheColor.errorColor,
          activeTickColor: PanacheColor.secondaryColor,
          inactiveTickColor: PanacheColor.secondaryColor,
          thumbColor: PanacheColor.primaryColor,
          thumbStrokeColor: isFocused.value ? PanacheColor.thirdlyColor : null,
          thumbStrokeWidth: isFocused.value ? 2 : null,
          tooltipBackgroundColor: PanacheColor.primaryColor,
          tooltipTextStyle: TextStyle(color: Colors.black),
          overlayColor: PanacheColor.primaryColor.withValues(alpha: 0.1),
          overlayRadius: 20.0,
        ),
        child: SfSlider(
          min: 0.0,
          max: unit.max,
          interval: unit.interval,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          value: unitNum,
          onChanged: (value) {
            onChanged(value.floor());
          },
        ),
      ),
    );
  }
}

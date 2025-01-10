import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/unit.dart';
import 'package:panache/src/ui/components/unit_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Panache extends HookWidget {
  const Panache({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedUnit = useState<Unit>(Unit.paragraphs);

    final unitNum = useState<double>(0.0);

    useEffect(() {
      unitNum.value = 0;
      return;
    }, [selectedUnit.value]);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 32.0),
                  child: SfSlider(
                    min: 0.0,
                    max: selectedUnit.value.max,
                    interval: selectedUnit.value.interval,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    value: unitNum.value,
                    onChanged: (value) {
                      unitNum.value = value.floor().toDouble();
                    },
                  ),
                ),
                FocusTraversalGroup(
                  policy: WidgetOrderTraversalPolicy(),
                  child: Column(
                    spacing: 16.0,
                    children: [
                      UnitButton(
                        unit: Unit.paragraphs,
                        onPressed: () {
                          selectedUnit.value = Unit.paragraphs;
                        },
                      ),
                      UnitButton(
                        unit: Unit.sentences,
                        onPressed: () {
                          selectedUnit.value = Unit.sentences;
                        },
                      ),
                      UnitButton(
                        unit: Unit.words,
                        onPressed: () {
                          selectedUnit.value = Unit.words;
                        },
                      ),
                      UnitButton(
                        unit: Unit.bytes,
                        onPressed: () {
                          selectedUnit.value = Unit.bytes;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 右側（スクロール可能エリア）
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(unitNum.value.toString())],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/unit.dart';
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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [
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
                  FilledButton(
                    onPressed: () {
                      selectedUnit.value = Unit.paragraphs;
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(Unit.paragraphs.text),
                  ),
                  FilledButton(
                    onPressed: () {
                      selectedUnit.value = Unit.sentences;
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(Unit.sentences.text),
                  ),
                  FilledButton(
                    onPressed: () {
                      selectedUnit.value = Unit.words;
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(Unit.words.text),
                  ),
                  FilledButton(
                    onPressed: () {
                      selectedUnit.value = Unit.bytes;
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(Unit.bytes.text),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(children: [Text(unitNum.value.toString())]),
            )
          ])
        ]),
      ),
    );
  }
}

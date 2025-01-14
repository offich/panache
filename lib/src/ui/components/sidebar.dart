import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/debouncer.dart';
import 'package:panache/src/model/unit.dart';
import 'package:panache/src/ui/style/text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Sidebar extends HookWidget {
  final Function({
    required int paragraphs,
    required int sentences,
    required int words,
  }) onNumsChanged;

  const Sidebar({
    super.key,
    required this.onNumsChanged,
  });

  @override
  Widget build(BuildContext context) {
    final paragraphsNum = useState<int>(Unit.paragraphs.defaultNum);
    final sentencesNum = useState<int>(Unit.sentences.defaultNum);
    final wordsNum = useState<int>(Unit.words.defaultNum);

    final debouncer = Debouncer(millseconds: 200);

    useEffect(() {
      debouncer.run(() {
        onNumsChanged(
          paragraphs: paragraphsNum.value,
          sentences: sentencesNum.value,
          words: wordsNum.value,
        );
      });

      return;
    }, [paragraphsNum.value, sentencesNum.value, wordsNum.value]);

    return Column(
      spacing: 24.0,
      children: [
        Column(children: [
          Text(
            'Panache',
            textAlign: TextAlign.center,
            style: PanacheTextStyle.largeBold,
          ),
          Text(
            '~ Lorem Ipsum Dummy Text Generator ~',
            style: PanacheTextStyle.medium,
          ),
        ]),
        FocusTraversalGroup(
          policy: WidgetOrderTraversalPolicy(),
          child: Column(
            spacing: 16.0,
            children: [
              Column(
                spacing: 4.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Unit.paragraphs.text,
                    style: PanacheTextStyle.medium,
                  ),
                  Row(children: [
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: const Icon(Icons.remove),
                      onPressed: paragraphsNum.value > 0
                          ? () {
                              paragraphsNum.value -= 1;
                            }
                          : null,
                    ),
                    SfSlider(
                      min: 1.0,
                      max: Unit.paragraphs.max,
                      interval: Unit.paragraphs.interval,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      value: paragraphsNum.value,
                      onChanged: (value) {
                        paragraphsNum.value = value.floor();
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: const Icon(Icons.add),
                      onPressed: paragraphsNum.value < Unit.paragraphs.max
                          ? () {
                              paragraphsNum.value += 1;
                            }
                          : null,
                    ),
                  ]),
                ],
              ),
              Column(
                spacing: 4.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Unit.sentences.text,
                    style: PanacheTextStyle.medium,
                  ),
                  Row(children: [
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: const Icon(Icons.remove),
                      onPressed: sentencesNum.value > 0
                          ? () {
                              sentencesNum.value -= 1;
                            }
                          : null,
                    ),
                    SfSlider(
                      min: 1.0,
                      max: Unit.sentences.max,
                      interval: Unit.sentences.interval,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      value: sentencesNum.value,
                      onChanged: (value) {
                        sentencesNum.value = value.floor();
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: const Icon(Icons.add),
                      onPressed: sentencesNum.value < Unit.sentences.max
                          ? () {
                              sentencesNum.value += 1;
                            }
                          : null,
                    ),
                  ]),
                ],
              ),
              Column(
                spacing: 4.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Unit.words.text,
                    style: PanacheTextStyle.medium,
                  ),
                  Row(children: [
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: const Icon(Icons.remove),
                      onPressed: wordsNum.value > 0
                          ? () {
                              wordsNum.value -= 1;
                            }
                          : null,
                    ),
                    SfSlider(
                      min: 1.0,
                      max: Unit.words.max,
                      interval: Unit.words.interval,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      value: wordsNum.value,
                      onChanged: (value) {
                        wordsNum.value = value.floor();
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon: const Icon(Icons.add),
                      onPressed: wordsNum.value < Unit.words.max
                          ? () {
                              wordsNum.value += 1;
                            }
                          : null,
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/debouncer.dart';
import 'package:panache/src/model/unit.dart';
import 'package:panache/src/ui/components/gradient_text.dart';
import 'package:panache/src/ui/components/panache_icon_button.dart';
import 'package:panache/src/ui/components/unit_slider.dart';
import 'package:panache/src/ui/style/color.dart';
import 'package:panache/src/ui/style/text.dart';

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
          GradientText('Panache'),
          Text(
            'Lorem Ipsum Dummy Text Generator',
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
                    PanacheIconButton(
                      icon: const Icon(Icons.remove),
                      color: PanacheColor.secondaryColor,
                      onPressed: paragraphsNum.value > 0
                          ? () {
                              paragraphsNum.value -= 1;
                            }
                          : null,
                    ),
                    UnitSlider(
                      unit: Unit.paragraphs,
                      unitNum: paragraphsNum.value,
                      onChanged: (value) {
                        paragraphsNum.value = value;
                      },
                    ),
                    PanacheIconButton(
                      icon: const Icon(Icons.remove),
                      color: PanacheColor.primaryColor,
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
                    PanacheIconButton(
                      icon: const Icon(Icons.remove),
                      color: PanacheColor.secondaryColor,
                      onPressed: sentencesNum.value > 0
                          ? () {
                              sentencesNum.value -= 1;
                            }
                          : null,
                    ),
                    UnitSlider(
                      unit: Unit.sentences,
                      unitNum: sentencesNum.value,
                      onChanged: (value) {
                        sentencesNum.value = value;
                      },
                    ),
                    PanacheIconButton(
                      icon: const Icon(Icons.remove),
                      color: PanacheColor.primaryColor,
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
                    PanacheIconButton(
                      icon: const Icon(Icons.remove),
                      color: PanacheColor.secondaryColor,
                      onPressed: wordsNum.value > 0
                          ? () {
                              wordsNum.value -= 1;
                            }
                          : null,
                    ),
                    UnitSlider(
                      unit: Unit.words,
                      unitNum: wordsNum.value,
                      onChanged: (value) {
                        wordsNum.value = value;
                      },
                    ),
                    PanacheIconButton(
                      icon: const Icon(Icons.remove),
                      color: PanacheColor.primaryColor,
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

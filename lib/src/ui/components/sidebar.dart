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

    final decrementParagraphsNum = useCallback(() {
      paragraphsNum.value -= 1;
    }, []);
    final incrementParagraphsNum = useCallback(() {
      paragraphsNum.value += 1;
    }, []);

    final decrementSentencesNum = useCallback(() {
      sentencesNum.value -= 1;
    }, []);
    final incrementSentencesNum = useCallback(() {
      sentencesNum.value += 1;
    });

    final decrementWordsNum = useCallback(() {
      wordsNum.value -= 1;
    }, []);
    final incrementWordsNum = useCallback(() {
      wordsNum.value += 1;
    }, []);

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
                          ? decrementParagraphsNum
                          : null,
                    ),
                    UnitSlider(
                      unit: Unit.paragraphs,
                      unitNum: paragraphsNum.value,
                      onChanged: (value) {
                        paragraphsNum.value = value;
                      },
                      onKeyArrowUp: paragraphsNum.value < Unit.paragraphs.max
                          ? incrementParagraphsNum
                          : null,
                      onKeyArrowRight: paragraphsNum.value < Unit.paragraphs.max
                          ? incrementParagraphsNum
                          : null,
                      onKeyArrowLeft: paragraphsNum.value > 0
                          ? incrementParagraphsNum
                          : null,
                      onKeyArrowDown: paragraphsNum.value > 0
                          ? incrementParagraphsNum
                          : null,
                    ),
                    PanacheIconButton(
                      icon: const Icon(Icons.add),
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
                      onPressed:
                          sentencesNum.value > 0 ? decrementSentencesNum : null,
                    ),
                    UnitSlider(
                      unit: Unit.sentences,
                      unitNum: sentencesNum.value,
                      onChanged: (value) {
                        sentencesNum.value = value;
                      },
                      onKeyArrowUp: sentencesNum.value < Unit.sentences.max
                          ? incrementSentencesNum
                          : null,
                      onKeyArrowRight: sentencesNum.value < Unit.sentences.max
                          ? incrementSentencesNum
                          : null,
                      onKeyArrowLeft:
                          sentencesNum.value > 0 ? incrementSentencesNum : null,
                      onKeyArrowDown:
                          sentencesNum.value > 0 ? incrementSentencesNum : null,
                    ),
                    PanacheIconButton(
                      icon: const Icon(Icons.add),
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
                      onPressed: wordsNum.value > 0 ? decrementWordsNum : null,
                    ),
                    UnitSlider(
                      unit: Unit.words,
                      unitNum: wordsNum.value,
                      onChanged: (value) {
                        wordsNum.value = value;
                      },
                      onKeyArrowUp: wordsNum.value < Unit.words.max
                          ? incrementWordsNum
                          : null,
                      onKeyArrowRight: wordsNum.value < Unit.words.max
                          ? incrementWordsNum
                          : null,
                      onKeyArrowLeft:
                          wordsNum.value > 0 ? incrementWordsNum : null,
                      onKeyArrowDown:
                          wordsNum.value > 0 ? incrementWordsNum : null,
                    ),
                    PanacheIconButton(
                      icon: const Icon(Icons.add),
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

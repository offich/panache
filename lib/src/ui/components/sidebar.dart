import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/debouncer.dart';
import 'package:panache/src/model/unit.dart';
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
      children: [
        Text(
          'Panache \n ~ Lorem Ipsum Dummy Text Generator ~',
          textAlign: TextAlign.center,
        ),
        FocusTraversalGroup(
          policy: WidgetOrderTraversalPolicy(),
          child: Column(
            spacing: 16.0,
            children: [
              Column(spacing: 4.0, children: [
                Text(Unit.paragraphs.text),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SfSlider(
                    min: 0.0,
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
                ),
              ]),
              Column(spacing: 4.0, children: [
                Text(Unit.sentences.text),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SfSlider(
                    min: 0.0,
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
                ),
              ]),
              Column(spacing: 4.0, children: [
                Text(Unit.words.text),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SfSlider(
                    min: 0.0,
                    max: Unit.words.max,
                    interval: Unit.words.interval,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    value: wordsNum.value,
                    onChanged: (value) {
                      wordsNum.value = value.floor();

                      onNumsChanged(
                        paragraphs: paragraphsNum.value,
                        sentences: sentencesNum.value,
                        words: wordsNum.value,
                      );
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

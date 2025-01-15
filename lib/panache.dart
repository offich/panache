import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/lorem.dart';
import 'package:panache/src/ui/components/lorem_text.dart';
import 'package:panache/src/ui/components/sidebar.dart';

class Panache extends HookWidget {
  const Panache({super.key});

  @override
  Widget build(BuildContext context) {
    final generated = useState(Lorem().generate());

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          SizedBox(
            width: 280,
            child: Sidebar(onNumsChanged: ({
              required paragraphs,
              required sentences,
              required words,
            }) {
              generated.value = Lorem().generate(
                paragraphs: paragraphs,
                sentences: sentences,
                words: words,
              );
            }),
          ),
          VerticalDivider(thickness: 4, color: Colors.yellow),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [LoremText(text: generated.value)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

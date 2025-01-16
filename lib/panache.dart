import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/lorem.dart';
import 'package:panache/src/ui/components/animated_text.dart';
import 'package:panache/src/ui/components/panache_snack_bar.dart';
import 'package:panache/src/ui/components/sidebar.dart';
import 'package:panache/src/ui/style/color.dart';

class Panache extends HookWidget {
  const Panache({super.key});

  @override
  Widget build(BuildContext context) {
    final generated = useState(Lorem().generate());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        children: [
          Padding(
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
                VerticalDivider(
                  thickness: 4,
                  color: PanacheColor.primaryColor,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [AnimatedText(text: generated.value)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: SizedBox(
              width: 48,
              height: 48,
              child: IconButton(
                style: IconButton.styleFrom(
                  foregroundColor: PanacheColor.primaryColor,
                  backgroundColor: PanacheColor.thirdlyColor,
                ),
                padding: EdgeInsets.all(0.0),
                icon: const Icon(Icons.copy),
                onPressed: () async {
                  showSnackBar(context);

                  await Clipboard.setData(ClipboardData(text: generated.value));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

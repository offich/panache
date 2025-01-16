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
    final copying = useState(false);

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
                icon: Icon(
                  copying.value ? Icons.hourglass_empty : Icons.copy,
                ),
                onPressed: () async {
                  copying.value = true;

                  try {
                    await Clipboard.setData(
                      ClipboardData(text: generated.value),
                    );
                    copying.value = false;

                    if (context.mounted) {
                      showSnackBar(context, 'Copied Text!!');
                    }
                  } catch (e) {
                    copying.value = false;

                    if (context.mounted) {
                      showSnackBar(context, 'Copied Failure', isError: true);
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/model/lorem.dart';
import 'package:panache/src/ui/components/animated_text.dart';
import 'package:panache/src/ui/components/sidebar.dart';

class Panache extends HookWidget {
  const Panache({super.key});

  @override
  Widget build(BuildContext context) {
    final generated = useState(Lorem().generate());

    return Stack(
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
              VerticalDivider(thickness: 4, color: Colors.yellow),
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
                foregroundColor: Colors.orange,
                backgroundColor: Colors.yellow,
              ),
              padding: EdgeInsets.all(0.0),
              icon: const Icon(Icons.copy),
              onPressed: () async {
                final snackBar = SnackBar(
                  width: 360.0,
                  content: const Text("Copied Text!!"),
                  duration: const Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                await Clipboard.setData(ClipboardData(text: generated.value));
              },
            ),
          ),
        )
      ],
    );
  }
}

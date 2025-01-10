import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:panache/src/ui/components/sidebar.dart';

class Panache extends HookWidget {
  const Panache({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          SizedBox(
            width: 200,
            child: Sidebar(),
          ),
          // 右側（スクロール可能エリア）
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(0.toString())],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

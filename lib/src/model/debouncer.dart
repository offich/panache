import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int millseconds;
  Timer? timer;

  Debouncer({required this.millseconds});

  void run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: millseconds), action);
  }
}

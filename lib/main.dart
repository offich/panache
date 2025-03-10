import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';

import 'package:panache/panache.dart';

/// Runs Panache on DevToolsExtension
void main() {
  runApp(DevToolsExtension(child: const Panache()));
}

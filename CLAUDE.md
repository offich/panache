# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Panache is a Flutter DevTools Extension that adds a Lorem Ipsum dummy text generator to Flutter's DevTools. It uses the `devtools_extensions` framework and is published to pub.dev.

## Commands

### Development

Run in Chrome with a simulated DevTools environment (no host app needed):
```bash
flutter run -d chrome --dart-define=use_simulated_environment=true
```

Run against a real DevTools environment:
```bash
dart run devtools_extensions build_and_copy --source=. --dest=./extension/devtools
cd example && flutter run
```

### Lint & Format
```bash
flutter analyze lib test
dart format --set-exit-if-changed lib test
```

### Build & Validate
```bash
dart run devtools_extensions build_and_copy --source=. --dest=./extension/devtools
dart run devtools_extensions validate --package=.
```

### Flutter Version

This project uses FVM. The pinned Flutter version is `3.29.0` (see `.fvmrc`). Prefix commands with `fvm` if using FVM (e.g., `fvm flutter run ...`).

## Architecture

### Entry Points
- `lib/main.dart` — Wraps the app in `DevToolsExtension`, the required entry point for all DevTools extensions.
- `lib/panache.dart` — Root `HookWidget` that composes the sidebar, generated text display, and copy button.

### Core Layers

**Model (`lib/src/model/`)**
- `lorem.dart` — Text generation logic. `Lorem.generate()` takes paragraph/sentence/word counts and builds nested lists of random words from the constants pool. Word selection is biased 50% toward shorter words.
- `unit.dart` — `Unit` enum (paragraphs, sentences, words, bytes) that drives slider config: `max`, `interval`, and `defaultNum` per unit.
- `debouncer.dart` — Delays text regeneration on rapid slider input to avoid excessive rebuilds.

**UI (`lib/src/ui/`)**
- `components/sidebar.dart` — Control panel with sliders for each `Unit`.
- `components/unit_slider.dart` — Reusable `Syncfusion` slider bound to a `Unit`.
- `components/animated_text.dart` — Displays generated text with an animation.
- `style/` — Shared color palette and text styles.

### Key Patterns
- **`flutter_hooks` / `HookWidget`** — All stateful widgets use hooks (`useState`, `useCallback`) instead of `StatefulWidget`.
- **Debounced generation** — Slider changes go through `Debouncer` before calling `Lorem.generate()`.
- **DevTools extension framework** — The app must be wrapped in `DevToolsExtension` and built/copied via `devtools_extensions build_and_copy` before DevTools can load it.

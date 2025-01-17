# 🍹 panache

A [Flutter DevTools extension](https://pub.dev/packages/devtools_extensions) for Losem Ipsum Dummy Text Generator

## Features

This package adds a new tool to Flutter's DevTools, utilizing the new `devtools_extensions` framework. With this tool, you can generate dummy text by controlling the number of words, sentences, and paragraphs on the left. You can also copy the text to clipboard and paste it anywhere.

![screenshot](https://raw.githubusercontent.com/offich/panache/refs/heads/develop/resources/screenshot.png)

## Getting started

To add this package to your project, run:

```shell
$ flutter pub add panache
```

That’s it! Now you just need to open your DevTools and use the SharedPreferences tool!

## Contributing to this package

1. Fork this repository.
2. Run the following command, and you will see the extension running on chrome.

```shell
$ flutter run -d chrome --dart-define=use_simulated_environment=true
```

3. If you would like to see the extension running on a real DevTools Environment, run the following commands.

```shell
$ fvm dart run devtools_extensions build_and_copy --source=. --dest=./example/extension/devtools
$ cd example
$ flutter run
```

For more information, see the [devtools_extensions](https://pub.dev/packages/devtools_extensions) package documentation.

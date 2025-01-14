import 'dart:math';

import 'package:panache/src/constant/words.dart';
import 'package:panache/src/extension/string.dart';

class Lorem {
  Random random = Random();

  Lorem();

  String generate({
    int paragraphs = 1,
    int sentences = 3,
    int words = 8,
  }) {
    if (paragraphs < 0) {
      throw ArgumentError.value(paragraphs, "paragraphs");
    }

    if (sentences < 0) {
      throw ArgumentError.value(sentences, "sentences");
    }

    if (words < 0) {
      throw ArgumentError.value(words, "words");
    }

    return makeParagraphs(paragraphs, sentences: sentences, words: words);
  }

  String makeParagraphs(int num, {int sentences = 3, int words = 8}) {
    return List<int>.generate(num, (i) => i + 1).map((e) {
      return makeParagraph(sentences: sentences, words: words);
    }).join('\n\n');
  }

  String makeParagraph({int sentences = 3, int words = 8}) {
    return makeSentences(sentences, words: words);
  }

  String makeSentences(int num, {int words = 8}) {
    return List<int>.generate(num, (i) => i + 1)
        .map((e) => makeSentence(words))
        .join(' ');
  }

  String makeSentence(int num) {
    return '${makeWords(num).capitalize()}.';
  }

  String makeWords(int num) {
    return List<int>.generate(num, (i) => i + 1)
        .map((e) => makeWord())
        .join(' ');
  }

  String makeWord() {
    final n = randomInt(0, 1); // wants 50% of the word to be short or long

    String randomWord;
    do {
      randomWord = constantWords[random.nextInt(constantWords.length)];
    } while (n > 0 && randomWord.length > 5);

    return randomWord;
  }

  int randomInt(int min, int max) {
    return random.nextInt((max - min) + 1) + min;
  }
}

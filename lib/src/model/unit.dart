enum Unit {
  paragraphs,
  sentences,
  words,
  bytes,
}

extension UnitProps on Unit {
  double get max {
    switch (this) {
      case Unit.paragraphs:
        return 5.0;
      case Unit.sentences:
        return 20.0;
      case Unit.words:
        return 100.0;
      case Unit.bytes:
        return 500.0;
    }
  }

  double get interval {
    return max / 5;
  }

  String get text {
    switch (this) {
      case Unit.paragraphs:
        return 'Paragraphs';
      case Unit.sentences:
        return 'Sentences';
      case Unit.words:
        return 'Words';
      case Unit.bytes:
        return 'Bytes';
    }
  }

  int get defaultNum {
    switch (this) {
      case Unit.paragraphs:
        return 1;
      case Unit.sentences:
        return 3;
      case Unit.words:
        return 8;
      case Unit.bytes:
        return 0;
    }
  }
}

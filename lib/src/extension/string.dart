extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return '';

    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

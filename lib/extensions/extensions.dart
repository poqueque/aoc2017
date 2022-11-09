extension StringExtensions on String {
  List<String> get chars =>
      runes.map((int rune) => String.fromCharCode(rune)).toList();
}

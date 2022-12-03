extension StringExtensions on String {
  List<String> get chars =>
      runes.map((int rune) => String.fromCharCode(rune)).toList();
}

extension IntExtensions on int {
  String toBinary(int pad){
    return toRadixString(2).padLeft(pad, '0');
  }
}
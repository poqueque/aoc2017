
import '../aoc2017.dart';

class Day04 extends Day {

  @override
  part1() {
    return inputList.map((e) => isValid(e)).where((element) => element).length;
  }

  bool isValid(String s){
    var words = s.split(" ");
    var words2 = <String>[];
    for (var element in words) {
      if (words2.contains(element)) return false;
      words2.add(element);
    }
    return true;
  }

  bool isValid2(String s){
    var words = s.split(" ");
    var words2 = <String>[];
    for (var element in words) {
      var runes = element.runes.toList();
      runes.sort();
      var elementOrdered = runes.toString();
      if (words2.contains(elementOrdered)) return false;
      words2.add(elementOrdered);
    }
    return true;
  }

  @override
  part2() {
    return inputList.map((e) => isValid2(e)).where((element) => element).length;
  }
}
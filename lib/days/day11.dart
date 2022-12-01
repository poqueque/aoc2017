import '../aoc2017.dart';

class Day11 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    List<String> data = inputString.split(",");
    return getDistance(data);
  }

  @override
  part2() {
    List<String> data = inputString.split(",");
    var max = 0;
    for (int i = 1; i < data.length; i++) {
      var d = getDistance(data.take(i).toList());
      if (d > max) max = d;
    }
    return max;
  }

  getDistance(List<String> data) {
    int ne = data.where((element) => element == "ne").length -
        data.where((element) => element == "sw").length;
    int n = data.where((element) => element == "n").length -
        data.where((element) => element == "s").length;
    return n + ne;
  }
}

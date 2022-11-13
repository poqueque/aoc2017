import 'dart:math';

import '../aoc2017.dart';

class Day02 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    int sum = 0;
    for (var line in inputArray) {
      sum += line.map((e) => int.parse(e)).reduce(max) -
          line.map((e) => int.parse(e)).reduce(min);
    }
    return sum;
  }

  @override
  part2() {
    int sum = 0;
    for (var line in inputArray) {
      var numberLine = line.map((e) => int.parse(e));
      var exactDiv = getExactDivision(numberLine);
      sum += exactDiv;
    }
    return sum;
  }

  int getExactDivision(Iterable<int> numberLine) {
    for (var number in numberLine) {
      for (var otherNumber in numberLine) {
        var big = (number > otherNumber) ? number : otherNumber;
        var small = (number < otherNumber) ? number : otherNumber;
        if (big != small && big % small == 0) {
          return big ~/ small;
        }
      }
    }
    return -10000000;
  }
}

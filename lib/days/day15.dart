import 'dart:math';

import 'package:aoc2017/extensions/extensions.dart';

import '../aoc2017.dart';

class Day15 extends Day {
  @override
  bool get completed => true;

  static const A = 16807;
  static const B = 48271;

  @override
  part1() {
    var a = 618;
    var b = 814;
    var total = 0;
    for (int i = 0; i < 40000000; i++) {
      a = (a * A) % 2147483647;
      b = (b * B) % 2147483647;
      var lowA = a.toBinary(32).substring(16);
      var lowB = b.toBinary(32).substring(16);
      if (lowA == lowB) {
        //print("$lowA $lowB");
        total++;
      }
    }
    return total;
  }

  @override
  part2() {
    var a = 618;
    var b = 814;
    var total = 0;
    List<int> genA = [];
    List<int> genB = [];
    while (genA.length < 5000000) {
      a = (a * A) % 2147483647;
      if (a % 4 == 0) genA.add(a);
    }
    while (genB.length < 5000000) {
      b = (b * B) % 2147483647;
      if (b % 8 == 0) genB.add(b);
    }
    for (int i = 0; i < min(genA.length, genB.length); i++) {
      if (genA[i].toBinary(32).substring(16) ==
          genB[i].toBinary(32).substring(16)) {
        total++;
      }
    }
    return total;
  }
}

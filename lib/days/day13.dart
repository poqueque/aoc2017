import 'dart:math';

import '../aoc2017.dart';

class Day13 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    var layers = <int, int>{};
    var severity = 0;
    for (var element in inputList) {
      var parts = element.split(": ");
      var layer = int.parse(parts[0]);
      var period = (int.parse(parts[1]) - 1) * 2;
      layers[layer] = period;
    }
    for (int i = 0; i <= layers.keys.reduce(max); i++) {
      if (layers[i] != null && i % layers[i]! == 0) {
        severity += i * (layers[i]! ~/ 2 + 1);
      }
    }
    return severity;
  }

  @override
  part2() {
    var layers = <int, int>{};
    var severity = 10;
    for (var element in inputList) {
      var parts = element.split(": ");
      var layer = int.parse(parts[0]);
      var period = (int.parse(parts[1]) - 1) * 2;
      layers[layer] = period;
    }
    var delay = -1;
    while (severity > 0) {
      delay++;
      severity = 0;
      for (int i = 0; i <= layers.keys.reduce(max); i++) {
        if (layers[i] != null && (delay + i) % layers[i]! == 0) {
          severity += 1;
        }
      }
    }
    return delay;
  }
}

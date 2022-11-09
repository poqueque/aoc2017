import 'package:aoc2017/extensions/extensions.dart';

import '../aoc2017.dart';

class Day01 extends Day {

  @override
  bool get completed => true;

  @override
  part1() {
    var total = 0;
    List<int> data = inputString.chars.map((e) => int.parse(e)).toList();
    for (int i=0; i<data.length; i++){
      if (data[i] == data[(i+1)%data.length]) total+=data[i];
    }
    return total;
  }

  @override
  part2() {
    var total = 0;
    List<int> data = inputString.chars.map((e) => int.parse(e)).toList();
    for (int i=0; i<data.length; i++){
      if (data[i] == data[(i+data.length~/2)%data.length]) total+=data[i];
    }
    return total;
  }
}
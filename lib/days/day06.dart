
import 'dart:math';

import '../aoc2017.dart';

class Day06 extends Day {

  @override
  bool get completed => true;

  @override
  part1() {
    var data = inputString.split("\t").map((e) => int.parse(e)).toList();
    List<String> status = [data.join(" ")];

    int cycles = 0;
    var duplicateDetected = false;
    while (!duplicateDetected){
      //redistribute
      var m = data.reduce(max);
      var p = data.indexWhere((e) => e == m);
      data[p] = 0;
      while (m>0){
        p++;
        data[p%data.length]++;
        m--;
      }
      if(status.contains(data.join(" "))) duplicateDetected = true;
      status.add(data.join(" "));
      print(data.join(" "));
      cycles++;
    }
    return cycles;
  }

  @override
  part2() {

    var data = inputString.split("\t").map((e) => int.parse(e)).toList();
    List<String> status = [data.join(" ")];

    int cycles = 0;
    var duplicateFoundAt = -1;
    while (duplicateFoundAt<0){
      //redistribute
      var m = data.reduce(max);
      var p = data.indexWhere((e) => e == m);
      data[p] = 0;
      while (m>0){
        p++;
        data[p%data.length]++;
        m--;
      }
      if(status.contains(data.join(" "))) duplicateFoundAt = status.indexWhere((element) => element == data.join(" "));
      status.add(data.join(" "));
      print(data.join(" "));
      cycles++;
    }
    return cycles - duplicateFoundAt;
  }
}
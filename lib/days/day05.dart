
import '../aoc2017.dart';

class Day05 extends Day {

  @override
  bool get completed => true;

  @override
  part1() {
    List<int> data = inputList.map((e) => int.parse(e)).toList();
    int pointer = 0;
    var steps = 0;
    while (pointer < data.length){
      var newPointer = pointer + data[pointer];
      data[pointer]++;
      pointer = newPointer;
      //print(data.join(" "));
      steps++;
    }
    return steps;
  }

  @override
  part2() {
    List<int> data = inputList.map((e) => int.parse(e)).toList();
    int pointer = 0;
    var steps = 0;
    while (pointer < data.length){
      var newPointer = pointer + data[pointer];
      if (data[pointer] > 2) {
        data[pointer]--;
      } else {
        data[pointer]++;
      }
      pointer = newPointer;
      //print(data.join(" "));
      steps++;
    }
    return steps;
  }
}
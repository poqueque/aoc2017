import '../aoc2017.dart';

class Day25 extends Day {

  var state = "A";
  var tape = <int>[]; //only store 1s
  var cursor = 0;

  @override
  part1() {
    for (var i = 0; i < 12208951; i++){
      step();
    }
    return tape.length;
  }

  @override
  part2() {
    return "0";
  }

  void step() {
    if (state == "A") {
      if (!tape.contains(cursor)) {
        tape.add(cursor);
        cursor++;
        state = "B";
      } else {
        tape.remove(cursor);
        cursor--;
        state = "E";
      }
    }
    else if (state == "B") {
      if (!tape.contains(cursor)) {
        tape.add(cursor);
        cursor--;
        state = "C";
      } else {
        tape.remove(cursor);
        cursor++;
        state = "A";
      }
    }
    else if (state == "C") {
      if (!tape.contains(cursor)) {
        tape.add(cursor);
        cursor--;
        state = "D";
      } else {
        tape.remove(cursor);
        cursor++;
        state = "C";
      }
    }
    else if (state == "D") {
      if (!tape.contains(cursor)) {
        tape.add(cursor);
        cursor--;
        state = "E";
      } else {
        tape.remove(cursor);
        cursor--;
        state = "F";
      }
    }
    else if (state == "E") {
      if (!tape.contains(cursor)) {
        tape.add(cursor);
        cursor--;
        state = "A";
      } else {
        cursor--;
        state = "C";
      }
    }
    else if (state == "F") {
      if (!tape.contains(cursor)) {
        tape.add(cursor);
        cursor--;
        state = "E";
      } else {
        cursor++;
        state = "A";
      }
    }
  }
}
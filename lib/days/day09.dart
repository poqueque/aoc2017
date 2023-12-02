import 'package:aoc2017/extensions/extensions.dart';

import '../aoc2017.dart';

class Day09 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    var level = 0;
    var score = 0;
    bool isGarbage = false;
    bool nextIgnore = false;
    for (String c in inputString.chars) {
      if (nextIgnore) {
        nextIgnore = false;
      } else if (c == "!") {
        nextIgnore = true;
      } else if (isGarbage) {
        if (c == ">") isGarbage = false;
      } else if (c == "<") {
        isGarbage = true;
      } else if (c == "{") {
        level++;
      } else if (c == "}") {
        score += level;
        level--;
      }
    }
    return score;
  }

  @override
  part2() {
    var level = 0;
    // ignore: unused_local_variable
    var score = 0;
    var garbageChars = 0;
    bool isGarbage = false;
    bool nextIgnore = false;
    for (String c in inputString.chars) {
      if (nextIgnore) {
        nextIgnore = false;
      } else if (c == "!") {
        nextIgnore = true;
      } else if (isGarbage) {
        if (c == ">") {
          isGarbage = false;
        } else {
          garbageChars++;
        }
      } else if (c == "<") {
        isGarbage = true;
      } else if (c == "{") {
        level++;
      } else if (c == "}") {
        score += level;
        level--;
      }
    }
    return garbageChars;
  }
}

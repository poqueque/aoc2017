
import 'package:aoc2017/utils/jmp_code.dart';

import '../aoc2017.dart';

class Day08 extends Day {

  @override
  bool get completed => true;

  @override
  part1() {
    var jmpCode = JmpCode(inputList);
    return jmpCode.run();
  }

  @override
  part2() {
    var jmpCode = JmpCode(inputList);
    return jmpCode.runMaxDuringProcess();
  }
}
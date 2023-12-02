import '../aoc2017.dart';

class Day23 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    Coprocessor c = Coprocessor(inputList, true);
    return c.run();
  }

  @override
  part2() {
    // ignore: unused_local_variable
    var (a, b, c, d, e, f, g, h) = (1, 0, 0, 0, 0, 0, 0, 0);
    b = 79;
    b = b * 100 + 100000;
    c = b + 17000;
    do {
      f = 1;
      d = 2;
      e = 2;
      for (d=2; d*d<=b; d++){
        if (b%d ==0) {
          f=0;
          break;
        }
      }
      if (f == 0) h++;
      g = b - c;
      b = b + 17;
    } while (g != 0);
    return h;
  }
}

class Coprocessor {
  List<String> input;
  bool debugMode = false;

  var ram = <List<String>>[];
  int pc = 0;
  var countMul = 0;
  Map<String, int> data = {};

  Coprocessor(this.input, this.debugMode) {
    ram = input.map((e) => ("$e .").split(" ").toList()).toList();
    if (!debugMode) data["a"] = 1;
  }

  bool isReg(String s) {
    return s.length == 1 && s.codeUnitAt(0) >= 97 && s.codeUnitAt(0) <= 122;
  }

  int getValue(String s) {
    if (isReg(s)) {
      return data[s] ?? 0;
    } else {
      return int.parse(s);
    }
  }

  int run() {
    while (pc < ram.length) {
      var inst = ram[pc][0];
      var op1 = ram[pc][1];
      var op2 = ram[pc][2];

      switch (inst) {
        case "set":
          if (isReg(op1)) data[op1] = getValue(op2);
          if (op1 == "h") print(data["h"]);
          break;
        case "sub":
          if (isReg(op1)) data[op1] = (data[op1] ?? 0) - getValue(op2);
          if (op1 == "h") print(data["h"]);
          break;
        case "mul":
          if (isReg(op1)) data[op1] = (data[op1] ?? 0) * getValue(op2);
          if (op1 == "h") print(data["h"]);
          countMul++;
          break;
        case "jnz":
          if (getValue(op1) != 0) pc += getValue(op2) - 1;
          break;
      }
      pc++;
    }
    if (debugMode) {
      return countMul;
    } else {
      return data["h"] ?? 0;
    }
  }
}

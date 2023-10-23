import '../aoc2017.dart';

class Day18 extends Day {
  @override
  part1() {
    var vals = <String, int>{};
    var lastPlayed = 0;

    var i = inputList;
    int pos = 0;
    bool cont = true;
    while (cont) {
      var p = i[pos].split(" ");
      switch (p[0]) {
        case "set":
          vals[p[1]] = int.tryParse(p[2]) ?? vals[p[2]]!;
          pos++;
          break;
        case "add":
          vals[p[1]] = (vals[p[1]] ?? 0) + (int.tryParse(p[2]) ?? vals[p[2]])!;
          pos++;
          break;
        case "mul":
          vals[p[1]] = (vals[p[1]] ?? 0) * (int.tryParse(p[2]) ?? vals[p[2]])!;
          pos++;
          break;
        case "mod":
          vals[p[1]] = (vals[p[1]] ?? 0) % (int.tryParse(p[2]) ?? vals[p[2]])!;
          pos++;
          break;
        case "snd":
          lastPlayed = int.tryParse(p[1]) ?? vals[p[1]] ?? 0;
          pos++;
          break;
        case "rcv":
          if ((int.tryParse(p[1]) ?? vals[p[1]] ?? 0) != 0) return lastPlayed;
          pos++;
          break;
        case "jgz":
          if ((int.tryParse(p[1]) ?? vals[p[1]] ?? 0) != 0) {
            pos += int.tryParse(p[2]) ?? vals[p[2]] ?? 0;
          } else {
            pos++;
          }
          break;
      }
    }
  }

  @override
  part2() {
    var d1 = Duet(inputList, 0);
    var d2 = Duet(inputList, 1);
    var result1 = 1;
    var result2 = 1;
    while (true) {
      if (result1 != 0) result1 = d1.run();
      d2.inputQueue.addAll(d1.outputQueue);
      d1.outputQueue.clear();
      if (result2 != 0) result2 = d2.run();
      d1.inputQueue.addAll(d2.outputQueue);
      d2.outputQueue.clear();
      if (result1 == 0 && result2 == 0) break;
      if (result1<0 && result2<0 && d1.inputQueue.isEmpty && d2.inputQueue.isEmpty) break;
    }
    return d2.count;
  }
}

class Duet {
  List<String> input;
  int regP;

  var ram = <List<String>>[];
  var pc = 0;
  var count =0;
  var inputQueue = <int>[];
  var outputQueue = <int>[];
  Map<String, int> data = {};

  Duet(this.input, this.regP){
    ram = input.map((e) => ("$e .").split(" ").toList()).toList();
    data["p"] = regP;
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
        case "snd":
          outputQueue.add(data[op1] ?? 0);
          count++;
          break;
        case "set":
          if (isReg(op1)) data[op1] = getValue(op2);
          break;
        case "add":
          if (isReg(op1)) data[op1] = (data[op1] ?? 0) + getValue(op2);
          break;
        case "mul":
          if (isReg(op1)) data[op1] = (data[op1] ?? 0) * getValue(op2);
          break;
        case "mod":
          if (isReg(op1)) data[op1] = (data[op1] ?? 0) % getValue(op2);
          break;
        case "rcv":
          if (inputQueue.isEmpty) return -1;
          data[op1] = inputQueue.removeAt(0);
          break;
        case "jgz":
          if (getValue(op1) > 0) pc += getValue(op2) - 1;
          break;
      }
      pc++;
    }
    return 0;
  }
}
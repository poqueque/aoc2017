import 'dart:math';

class JmpCode {
  var vars = <String, int>{};
  List<Instruction> instructions = [];

  JmpCode(List<String> instructionSet) {
    instructions = instructionSet.map((e) => Instruction(e)).toList();
  }

  int run() {
    for (var instruction in instructions) {
      process(instruction);
    }
    return vars.values.reduce(max);
  }

  int runMaxDuringProcess() {
    int maxDuringProcess = 0;
    for (var instruction in instructions) {
      process(instruction);
      var currentMax = vars.values.reduce(max);
      if (currentMax > maxDuringProcess) maxDuringProcess = currentMax;
    }
    return maxDuringProcess;
  }

  inc(String aVar, int aVal) {
    vars[aVar] ??= 0;
    vars[aVar] = vars[aVar]! + aVal;
  }

  dec(String aVar, int aVal) {
    vars[aVar] ??= 0;
    vars[aVar] = vars[aVar]! - aVal;
  }

  process(Instruction instruction) {
    bool condition = false;
    var leftVal = vars[instruction.conditionVar] ?? 0;
    if (instruction.comparator == "==" && leftVal == instruction.conditionVal) {
      condition = true;
    }
    if (instruction.comparator == "<" && leftVal < instruction.conditionVal) {
      condition = true;
    }
    if (instruction.comparator == "<=" && leftVal <= instruction.conditionVal) {
      condition = true;
    }
    if (instruction.comparator == ">" && leftVal > instruction.conditionVal) {
      condition = true;
    }
    if (instruction.comparator == ">=" && leftVal >= instruction.conditionVal) {
      condition = true;
    }
    if (instruction.comparator == "!=" && leftVal != instruction.conditionVal) {
      condition = true;
    }

    if (condition) {
      if (instruction.action == "inc") {
        inc(instruction.variable, instruction.value);
      }
      if (instruction.action == "dec") {
        dec(instruction.variable, instruction.value);
      }
    }
  }
}

class Instruction {
  late final String variable;
  late final String action;
  late final int value;
  late final String conditionVar;
  late final String comparator;
  late final int conditionVal;

  Instruction(String instruction) {
    var parts = instruction.split(" ");
    variable = parts[0];
    action = parts[1];
    value = int.parse(parts[2]);
    conditionVar = parts[4];
    comparator = parts[5];
    conditionVal = int.parse(parts[6]);
  }
}

import 'dart:io';
import 'days/day01.dart';
import 'days/day02.dart';
import 'days/day03.dart';
import 'days/day04.dart';
import 'days/day05.dart';
import 'days/day06.dart';
import 'days/day07.dart';
import 'days/day08.dart';
import 'days/day09.dart';
import 'days/day10.dart';
import 'days/day11.dart';
import 'days/day12.dart';
import 'days/day13.dart';
import 'days/day14.dart';
import 'days/day15.dart';
import 'days/day16.dart';
import 'days/day17.dart';
import 'days/day18.dart';
import 'days/day19.dart';
import 'days/day20.dart';
import 'days/day21.dart';
import 'days/day22.dart';
import 'days/day23.dart';
import 'days/day24.dart';
import 'days/day25.dart';

abstract class Day {

  late final List<String> inputList;
  late final List<List<String>> inputArray;
  late final String inputString;
  bool completed = false;
  dynamic part1();
  dynamic part2();

  String get dataFileName => "${runtimeType.toString().toLowerCase()}.txt";

  void run() async {
    inputList = await File("lib/data/$dataFileName").readAsLines();
    inputArray = inputList.map((e) => e.replaceAll("\t", " ").split(" ")).toList();
    inputString = inputList[0];
    print(part1());
    print(part2());
  }
}

void main() {
  print('Advent Of Code 2017 - Dart');
  List<Day> days = [Day01(), Day02(), Day03(), Day04(), Day05(),
    Day06(), Day07(), Day08(), Day09(), Day10(),
    Day11(), Day12(), Day13(), Day14(), Day15(),
    Day16(), Day17(), Day18(), Day19(), Day20(),
    Day21(), Day22(), Day23(), Day24(), Day25(),
  ];
  var dayToRun = days.firstWhere((day) => !day.completed);
  print("Running ${dayToRun.runtimeType.toString()}");
  dayToRun.run();
}


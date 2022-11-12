import 'dart:io';
import 'days/day01.dart';
import 'days/day02.dart';

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
  List<Day> days = [Day01(), Day02()];
  var dayToRun = days.firstWhere((day) => !day.completed);
  print("Running ${dayToRun.runtimeType.toString()}");
  dayToRun.run();
}


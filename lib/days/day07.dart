import 'dart:math';

import '../aoc2017.dart';

Map<String,Program> programMap = {};
class Day07 extends Day {

  @override
  bool get completed => true;

  List<Program> programs = [];

  @override
  part1() {
    readData();
    var fathers = programs.where((element) => element.towers.isNotEmpty).toList();
    var gf = getParents(fathers);
    var gf2 = getParents(gf);
    var gf3 = getParents(gf2);
    var gf4 = getParents(gf3);
    return gf4.first.name;
  }

  @override
  part2() {
    readData();

    var fathers = programs.where((element) => element.towers.isNotEmpty).toList();
    var gf = getParents(fathers);
    var gf2 = getParents(gf);
    var gf3 = getParents(gf2);
    var gf4 = getParents(gf3);
    var main =  gf4.first;
//    print (main);
    for (var t in main.towers){
//      print(programMap[t]!);
      if (t == "xvuxc") {
        for (var t2 in programMap[t]!.towers) {
//          print(programMap[t2]!);
          if (t2 == "nieyygi") {
            for (var t3 in programMap[t2]!.towers) {
//              print(programMap[t3]!);
              if (t3 == "ptshtrn") {
                return programMap[t3]!.weight  - 5;
              }
            }
          }
        }
        var dif = programMap[t]!.unbalancedNode();

      }
    }

  }

  void readData() {
    for (String line in inputList) {
      var parts = line.split(" ");
      int weight = int.parse(parts[1].replaceAll("(", "").replaceAll(")", ""));
      var p = Program(parts[0], weight, []);
      if (parts.length > 2) {
        for (int i = 3; i < parts.length; i++) {
          p.add(parts[i].replaceAll(",", ""));
        }
      }
      programs.add(p);
      programMap[p.name] =p;
    }
  }

  List<Program> getParents(List<Program> children) {
    List<Program> gf = [];
    for (Program f in children){
      if (f.towers.indexWhere(children.map((e)=>e.name).contains) > -1){
        gf.add(f);
      }
    }
    return gf.toList();
  }
}

class Program {
  final String name;
  final int weight;
  List<String> towers = [];

  Program(this.name, this.weight, this.towers);

  add(String tower) {
    towers.add(tower);
  }
  @override
  String toString() {
    var total = weight;
    String n = "$name => $weight + (";
    n += towers.map((e) => programMap[e]!.compoundWeight()).toList().join(" + ");
    total += towers.map((e) => programMap[e]!.compoundWeight()).toList().reduce((value, element) => value + element);
    return "$n) = $total";
  }

  bool isBalanced (){
    List data = towers.map((e) => programMap[e]!.compoundWeight()).toSet().toList();
    if (data.length<2) return true;
    return false;
  }

  int unbalancedNode (){
    Map<int,int> weightCount = {};
    for (var t in towers){
      int w = programMap[t]!.compoundWeight();
      weightCount[w] = (weightCount[w] ?? 0) + 1;
    }
    if (weightCount.keys.length == 2) {
      var dif = weightCount.keys.reduce(max) - weightCount.keys.reduce(min);
      return dif;
    }
    return 0;
  }

  int compoundWeight (){
    var cw = weight;
    for (var t in towers) {
      cw += programMap[t]!.compoundWeight();
    }
    return cw;
  }
}

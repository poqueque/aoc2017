import '../aoc2017.dart';

class Day21 extends Day {

  @override
  bool get completed => true;

  @override
  part1() {
    return iterate(5);
  }

  iterate(int count) {
    readInput();
    String input = ".#./..#/###";
    for (int i = 0; i < count; i++){
      List<String> lines = input.split("/");
      int size = lines.length;
      int subSize = 2;
      if (size % 2 == 0){
        subSize = 2;
      } else if (size % 3 == 0){
        subSize = 3;
      }
      int subCount = size ~/ subSize;
      print ("size: $size subSize: $subSize subCount: $subCount");
      List<List<String>> subGrids = List.generate(subCount, (index) => List.generate(subCount, (index) => ""));
      for (int j = 0; j < subCount; j++){
        for (int k = 0; k < subCount; k++){
          String subGrid = "";
          for (int l = 0; l < subSize; l++){
            for (int m = 0; m < subSize; m++){
              subGrid += lines[j * subSize + l][k * subSize + m];
            }
            subGrid += "/";
          }
          subGrids[j][k] = step1(subGrid.substring(0, subGrid.length - 1));
        }
      }
      String output = "";
      if (subCount > 1) {
        for (int j = 0; j < subCount; j++){
          for (int n= 0; n < subSize + 1; n++){
            for (int k = 0; k < subCount; k++){
              output += subGrids[j][k].split("/")[n];
            }
            output += "/";
          }
        }
        output = output.substring(0, output.length - 1);
      } else {
        output = subGrids[0][0];
      }
      input = output;
      print("Step $i");
    }
    return countOn(input);
  }

  @override
  part2() {
    return iterate(18);
  }

  Map<String,String> rules = <String,String>{};

  int countOn(String input){
    int count = 0;
    for (int i = 0; i < input.length; i++){
      if (input[i] == "#"){
        count++;
      }
    }
    return count;
  }

  void readInput(){
    List<String> lines = inputList;
    for (String line in lines){
      List<String> parts = line.split(" => ");
      rules[parts[0]] = parts[1];
    }
  }

  String rotate (String input){
    List<String> lines = input.split("/");
    String output = "";
    for (int i = 0; i < lines.length; i++){
      for (int j = 0; j < lines.length; j++){
        output += lines[lines.length - j - 1][i];
      }
      output += "/";
    }
    return output.substring(0, output.length - 1);
  }

  String flip (String input){
    List<String> lines = input.split("/");
    String output = "";
    for (int i = 0; i < lines.length; i++){
      output += lines[lines.length - i - 1];
      output += "/";
    }
    return output.substring(0, output.length - 1);
  }

  String step1 (String input){
    if (rules.keys.contains(input)){
      return rules[input]!;
    }
    if (rules.keys.contains(flip(input))){
      return rules[flip(input)]!;
    }
    String rotated = rotate(input);
    if (rules.keys.contains(rotated)){
      return rules[rotated]!;
    }
    if (rules.keys.contains(flip(rotated))){
      return rules[flip(rotated)]!;
    }
    rotated = rotate(rotated);
    if (rules.keys.contains(rotated)){
      return rules[rotated]!;
    }
    if (rules.keys.contains(flip(rotated))){
      return rules[flip(rotated)]!;
    }
    rotated = rotate(rotated);
    if (rules.keys.contains(rotated)){
      return rules[rotated]!;
    }
    if (rules.keys.contains(flip(rotated))){
      return rules[flip(rotated)]!;
    }
    return "";
  }
}
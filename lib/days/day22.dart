
import '../aoc2017.dart';
import '../utils/coor.dart';

class Day22 extends Day {

  Map<Coor,String> map = {};
  Coor cursor = Coor(0,0);
  Direction direction = Direction.up;

  @override
  part1() {
    readMap();
    int infected = 0;
    for (int i = 0; i < 10000; i++) {
      infected += burst();
      //printMap();
    }
    return infected;
  }

  @override
  part2() {
    readMap();
    int infected = 0;
    for (int i = 0; i < 10000000; i++) {
      infected += burst2();
      //printMap();
    }
    return infected;
  }

  void readMap() {
    map.clear();
    var lines = inputList;
    int startingVal = lines.length ~/ 2;
    int y = -startingVal;
    for (var line in lines) {
      for (int i = 0; i < line.length; i++) {
        map[Coor(i-startingVal, y)] = line[i];
      }
      y++;
    }
    direction = Direction.up;
    cursor = Coor(0,0);
  }

  int burst() {
    bool infected;
    map[cursor] ??= ".";
    if (map[cursor] == "#") {
      direction = turnRight(direction);
      map[cursor] = ".";
      infected = false;
    } else {
      direction = turnLeft(direction);
      map[cursor] = "#";
      infected = true;
    }
    cursor = cursor.move(direction);
    map[cursor] ??= ".";
    return infected ? 1 : 0;
  }

  int burst2(){
    bool infected;
    map[cursor] ??= ".";
    if (map[cursor] == ".") {
      direction = turnLeft(direction);
      map[cursor] = "W";
      infected = false;
    } else if (map[cursor] == "W") {
      map[cursor] = "#";
      infected = true;
    } else if (map[cursor] == "#") {
      direction = turnRight(direction);
      map[cursor] = "F";
      infected = false;
    } else {
      direction = reverse(direction);
      map[cursor] = ".";
      infected = false;
    }
    cursor = cursor.move(direction);
    map[cursor] ??= ".";
    return infected ? 1 : 0;
  }

  void printMap() {
    int minX = 5;
    for (var y = -minX; y <= minX; y++) {
      String line = "";
      for (var x = -minX; x <= minX; x++) {
        if (cursor.x == x && cursor.y == y) {
          line += "[${map[Coor(x, y)] ?? "."}]";
        } else {
          line += " ${map[Coor(x, y)] ?? "."} ";
        }
      }
      print(line);
    }
    print("");
  }
}
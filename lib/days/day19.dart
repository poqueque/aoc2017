import '../aoc2017.dart';
import '../utils/coor.dart';

class Day19 extends Day {
  @override
  bool get completed => true;

  Map<Coor,String> map = {};
  Direction direction = Direction.down;

  @override
  part1() {
    var pointer = readMap();
    var letters = "";
    while (true) {
      var char = map[pointer];
      if (char == null) break;
      if (char == "+") {
        if (direction == Direction.up || direction == Direction.down) {
          if (map[pointer.move(Direction.left)] != " " && map[pointer.move(Direction.left)] != null) {
            direction = Direction.left;
          } else if (map[pointer.move(Direction.right)] != " " && map[pointer.move(Direction.right)] != null) {
            direction = Direction.right;
          } else {
            throw "No direction found";
          }
        } else {
          if (map[pointer.move(Direction.up)] != " " && map[pointer.move(Direction.up)] != null) {
            direction = Direction.up;
          } else if (map[pointer.move(Direction.down)] != " " && map[pointer.move(Direction.down)] != null) {
            direction = Direction.down;
          } else {
            throw "No direction found";
          }
        }
      } else if (char != "|" && char != "-") {
        if (char == " ") break;
        letters += char;
      }
      pointer = pointer.move(direction);
    }
    return letters;
  }

  @override
  part2() {
    var pointer = readMap();
    direction = Direction.down;
    var letters = "";
    var steps = 0;
    while (true) {
      var char = map[pointer];
      if (char == null) break;
      if (char == "+") {
        if (direction == Direction.up || direction == Direction.down) {
          if (map[pointer.move(Direction.left)] != " " && map[pointer.move(Direction.left)] != null) {
            direction = Direction.left;
          } else if (map[pointer.move(Direction.right)] != " " && map[pointer.move(Direction.right)] != null) {
            direction = Direction.right;
          } else {
            throw "No direction found";
          }
        } else {
          if (map[pointer.move(Direction.up)] != " " && map[pointer.move(Direction.up)] != null) {
            direction = Direction.up;
          } else if (map[pointer.move(Direction.down)] != " " && map[pointer.move(Direction.down)] != null) {
            direction = Direction.down;
          } else {
            throw "No direction found";
          }
        }
      } else if (char != "|" && char != "-") {
        if (char == " ") break;
        letters += char;
      }
      pointer = pointer.move(direction);
      steps++;
    }
    return steps;
  }

  Coor readMap() {
    var lines = inputList;
    Coor? start;
    for (int y = 0; y < lines.length; y++) {
      var line = lines[y];
      for (int x = 0; x < line.length; x++) {
        map[Coor(x,y)] = line[x];
        if (line[x] == "|" && start == null) start = Coor(x,y);
      }
    }
    return start!;
  }
}
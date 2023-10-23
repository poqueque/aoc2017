import 'dart:math';

enum Direction { left, right, up, down, front, back }

class Coor3 {
  late final int x;
  late final int y;
  late final int z;

  Coor3(this.x, this.y, this.z);

  Coor3.fromString(String s) {
    var p = s.split(",");
    x = int.parse(p[0]);
    y = int.parse(p[1]);
    z = int.parse(p[2]);
  }

  Coor3 operator +(Coor3 d) {
    return Coor3(x + d.x, y + d.y, z + d.z);
  }

  Coor3 operator -(Coor3 d) {
    return Coor3(x - d.x, y - d.y, z - d.z);
  }

  Coor3 operator *(int i) {
    return Coor3(x * i, y * i, z * i);
  }

  double mod() {
    return sqrt(x * x + y * y + z * z);
  }

  Coor3 move(Direction d) {
    switch (d) {
      case Direction.up:
        return Coor3(x, y - 1, z);
      case Direction.down:
        return Coor3(x, y + 1, z);
      case Direction.left:
        return Coor3(x - 1, y, z);
      case Direction.right:
        return Coor3(x + 1, y, z);
      case Direction.front:
        return Coor3(x, y, z + 1);
      case Direction.back:
        return Coor3(x, y, z - 1);
    }
  }

  @override
  bool operator ==(dynamic other) {
    return (x == other.x && y == other.y && z == other.z);
  }

  @override
  int get hashCode => "$x $y $z".hashCode;

  @override
  String toString() {
    return "[$x,$y,$z]";
  }

  int manhattanDistance(Coor3 c) {
    return (x - c.x).abs() + (y - c.y).abs() + (z - c.z).abs();
  }

  List<Coor3> neighbours() {
    return [
      Coor3(x - 1, y - 1, z - 1),
      Coor3(x - 1, y - 1, z),
      Coor3(x - 1, y - 1, z + 1),
      Coor3(x - 1, y, z - 1),
      Coor3(x - 1, y, z),
      Coor3(x - 1, y, z + 1),
      Coor3(x - 1, y + 1, z - 1),
      Coor3(x - 1, y + 1, z),
      Coor3(x - 1, y + 1, z + 1),
      Coor3(x, y - 1, z - 1),
      Coor3(x, y - 1, z),
      Coor3(x, y - 1, z + 1),
      Coor3(x, y + 1, z - 1),
      Coor3(x, y + 1, z),
      Coor3(x, y + 1, z + 1),
      Coor3(x + 1, y - 1, z - 1),
      Coor3(x + 1, y - 1, z),
      Coor3(x + 1, y - 1, z + 1),
      Coor3(x + 1, y, z - 1),
      Coor3(x + 1, y, z),
      Coor3(x + 1, y, z + 1),
      Coor3(x + 1, y + 1, z - 1),
      Coor3(x + 1, y + 1, z),
      Coor3(x + 1, y + 1, z + 1),
    ];
  }

  List<Coor3> neighboursWithoutDiagonals() {
    return [
      Coor3(x - 1, y, z),
      Coor3(x, y - 1, z),
      Coor3(x, y + 1, z),
      Coor3(x + 1, y, z),
      Coor3(x, y, z - 1),
      Coor3(x, y, z + 1),
    ];
  }

  double distance(Coor3 b) {
    return sqrt(pow(x - b.x, 2) + pow(y - b.y, 2)+ pow(z - b.z, 2));
  }

  List<Coor3> closestTo(double d) {
    List<Coor3> list = [];
    for (int i = x - d.floor() - 1; i < x + d.floor() + 1; i++) {
      for (int j = y - d.floor() - 1; j < y + d.floor() + 1; j++) {
        for (int k = z - d.floor() - 1; k < z + d.floor() + 1; k++) {
          if (distance(Coor3(i, j, k)) <= d) list.add(Coor3(i, j, k));
        }
      }
    }
    return list;
  }
/*
  Set<Coor> atManhattanDistance(int d) {
    Set<Coor> list = {};
    for (int i = 0; i < d; i++) {
      list.add(Coor(x - i, y - (d - i)));
      list.add(Coor(x - i, y + (d - i)));
      list.add(Coor(x + i, y - (d - i)));
      list.add(Coor(x + i, y + (d - i)));
    }
    return list;
  }

  Set<Coor> atManhattanDistanceCapped(int d, int min, int max) {
    Set<Coor> list = {};
    for (int i = 0; i < d; i++) {
      if (x - i >= min && y - (d - i) <= max)
        list.add(Coor(x - i, y - (d - i)));
      if (x - i >= min && y + (d - i) <= max)
        list.add(Coor(x - i, y + (d - i)));
      if (x + i >= min && y - (d - i) <= max)
        list.add(Coor(x + i, y - (d - i)));
      if (x + i >= min && y + (d - i) <= max)
        list.add(Coor(x + i, y + (d - i)));
    }
    return list;
  }
 */
}

/*
class CoorMap<T> {
  Map<Coor, T> map = {};

  int bounds(Direction direction) {
    var minX = 100000;
    var maxX = -100000;
    var minY = 100000;
    var maxY = -100000;
    for (var k in map.keys) {
      if (k.x < minX) minX = k.x;
      if (k.x > maxX) maxX = k.x;
      if (k.y < minY) minY = k.y;
      if (k.y > maxY) maxY = k.y;
    }
    switch (direction) {
      case Direction.up:
        return minY;
      case Direction.down:
        return maxY;
      case Direction.left:
        return minX;
      case Direction.right:
        return maxX;
      default:
        return 0;
    }
  }

  void printMap({bool spaces = true}) {
    String line = "";
    String s1 = spaces ? " " : "";
    String s2 = spaces ? " " : ".";
    for (var y = bounds(Direction.up); y <= bounds(Direction.down); y++) {
      for (var x = bounds(Direction.left); x <= bounds(Direction.right); x++) {
        line += "$s1${map[Coor(x, y)] ?? "$s2"}$s1";
      }
      print(line);
      line = "";
    }
  }
}*/

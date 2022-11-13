import 'dart:math';

enum Direction { left, right, up, down }

class Coor {
  final int x;
  final int y;

  Coor(this.x, this.y);

  Coor operator +(Coor d) {
    return Coor(x + d.x, y + d.y);
  }

  Coor operator -(Coor d) {
    return Coor(x - d.x, y - d.y);
  }

  Coor operator *(int i) {
    return Coor(x * i, y * i);
  }

  double mod() {
    return sqrt(x * x + y * y);
  }

  Coor move(Direction d) {
    switch (d) {
      case Direction.up:
        return Coor(x, y - 1);
      case Direction.down:
        return Coor(x, y + 1);
      case Direction.left:
        return Coor(x - 1, y);
      case Direction.right:
        return Coor(x + 1, y);
    }
  }

  bool hides(Coor d2) {
    var angle1 = atan2(y.toDouble(), x.toDouble());
    var angle2 = atan2(d2.y.toDouble(), d2.x.toDouble());
    var mod1 = sqrt(x.toDouble() * x.toDouble() + y.toDouble() * y.toDouble());
    var mod2 = sqrt(
        d2.x.toDouble() * d2.x.toDouble() + d2.y.toDouble() * d2.y.toDouble());
    return (angle1 == angle2 && mod1 < mod2);
  }

  @override
  bool operator ==(dynamic other) {
    return (x == other.x && y == other.y);
  }

  @override
  int get hashCode => "$x $y".hashCode;

  @override
  String toString() {
    return "[$x,$y]";
  }

  int manhattanDistance(Coor c) {
    return (x - c.x).abs() + (y - c.y).abs();
  }

  List<Coor> neighbours() {
    return [
      Coor(x - 1, y - 1),
      Coor(x - 1, y),
      Coor(x - 1, y + 1),
      Coor(x, y - 1),
      Coor(x, y + 1),
      Coor(x + 1, y - 1),
      Coor(x + 1, y),
      Coor(x + 1, y + 1),
    ];
  }
}

class CoorMap {
  Map<Coor, dynamic> map = {};

  int bounds(Direction direction) {
    var minX = 0;
    var maxX = 0;
    var minY = 0;
    var maxY = 0;
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
    }
  }

  void printMap() {
    String line = "";
    for (var y = bounds(Direction.up); y <= bounds(Direction.down); y++) {
      for (var x = bounds(Direction.left); x <= bounds(Direction.right); x++) {
        line += " ${map[Coor(x, y)] ?? " "} ";
      }
      print(line);
      line = "";
    }
  }
}

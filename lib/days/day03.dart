import 'dart:math';

import '../aoc2017.dart';
import '../utils/coor.dart';

class Day03 extends Day {
  @override
  bool get completed => true;

  part1b() {
    var input = int.parse(inputString);
    var intSqrt = sqrt(input).floor();
    // once arriving to 589^2 we start checking how many sides we can fill and in which position we remain
    var remainingSteps = 0;
    for (int i= 0; i<4; i++) {
      var remainingStepsIterate = input - (intSqrt*intSqrt + i*(intSqrt+1));
      if (remainingStepsIterate > 0) remainingSteps = remainingStepsIterate;
    }

    return remainingSteps;
  }

  @override
  part1() {
    var input = int.parse(inputString);
    var speedToGet = 1;
    var speed = 0;
    var repetitions = 2;
    var pointer = Coor(0,0);
    var value = 0;
    var flux = [Direction.down, Direction.right, Direction.up, Direction.left];
    var directionPointer = 0;
    CoorMap coorMap = CoorMap();

    coorMap.map[pointer] = value;

    while (value < input){
      value++;
      speed++;
      pointer = pointer.move(flux[directionPointer%4]);
      coorMap.map[pointer] = value;
      if (speed == speedToGet) {
        speed = 1;
        directionPointer++;
        if (repetitions == 2) {
          speedToGet++;
          repetitions = 0;
        }
        repetitions++;
      }
      //coorMap.printMap();
    }

    return pointer.manhattanDistance(Coor(0,0))+1;
  }

  @override
  part2() {

    var input = int.parse(inputString);
    var speedToGet = 1;
    var speed = 0;
    var repetitions = 2;
    var pointer = Coor(0,0);
    var value = 0;
    var flux = [Direction.down, Direction.right, Direction.up, Direction.left];
    var directionPointer = 0;
    CoorMap coorMap = CoorMap();

    coorMap.map[pointer] = value;

    while (value < input){
      speed++;
      pointer = pointer.move(flux[directionPointer%4]);
      value = pointer.neighbours().map((e) => coorMap.map[e] ?? 0).reduce((value, element) => value + element);
      if (value == 0) value = 1;
      coorMap.map[pointer] = value;
      if (speed == speedToGet) {
        speed = 1;
        directionPointer++;
        if (repetitions == 2) {
          speedToGet++;
          repetitions = 0;
        }
        repetitions++;
      }
      //coorMap.printMap();
    }

    return value;
  }
}
import 'package:aoc2017/extensions/extensions.dart';
import 'package:aoc2017/utils/coor.dart';

import '../aoc2017.dart';

class Day14 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    var totalSquares = 0;
    for (int i = 0; i < 128; i++) {
      var k = knotHash("$inputString-$i");
//      print("$inputString-$i");
//      print(k);
//      print (int.parse(k.substring(0,2),radix: 16).toRadixString(2).padLeft(8,'0'));
      var squares = 0;
      for (int j = 0; j < k.length; j += 2) {
        var kBinary = int.parse(k.substring(j, j + 2), radix: 16)
            .toRadixString(2)
            .padLeft(8, '0');
        squares += kBinary.chars.where((element) => element == "1").length;
      }
      totalSquares += squares;
    }
    return totalSquares;
  }

  CoorMap map = CoorMap();

  @override
  part2() {
    var totalRegions = 0;
    for (int i = 0; i < 128; i++) {
      var k = knotHash("$inputString-$i");
      var kBinary = "";
      for (int j = 0; j < k.length; j += 2) {
        kBinary += int.parse(k.substring(j, j + 2), radix: 16)
            .toRadixString(2)
            .padLeft(8, '0');
      }
      var chars = kBinary.chars;
      for (int j = 0; j < 128; j++) {
        map.map[Coor(j, i)] = chars[j];
      }
    }
    var firstSquare = map.map.keys
        .firstWhere((key) => map.map[key] == "1", orElse: () => Coor(-1, -1));
    while (firstSquare != Coor(-1, -1)) {
      //map.printMap(spaces: false);
      //print("");
      totalRegions++;
      reset(firstSquare);
      firstSquare = map.map.keys
          .firstWhere((key) => map.map[key] == "1", orElse: () => Coor(-1, -1));
    }
    return totalRegions;
  }

  String knotHash(String inputData) {
    var N = 256;
    var skipSize = 0;
    var input = inputData.runes.toList();
    input.addAll([17, 31, 73, 47, 23]);
    List<int> data = List.generate(N, (index) => index);
    var initPointer = 0;
    for (int round = 0; round < 64; round++) {
      for (int i in input) {
        var newData = <int>[];
        for (int k = i; k < N; k++) {
          newData.add(data[k]);
        }
        for (int k = i - 1; k >= 0; k--) {
          newData.add(data[k]);
        }
        //skip size
        data.clear();
        for (int k = skipSize % N; k < N; k++) {
          data.add(newData[k]);
        }
        for (int k = 0; k < skipSize % N; k++) {
          data.add(newData[k]);
        }
        initPointer = (initPointer - i - skipSize) % N;
        skipSize++;
      }
    }

    //XOR Operations
//    data = [65,27,9,1,4,3,40,50,91,7,6,0,2,5,68,22];
    String hexHash = "";
    for (int i = 0; i < 16; i++) {
      var hash = 0;
      for (int k = 0; k < 16; k++) {
        hash = hash ^ data[(initPointer + 16 * i + k) % N];
      }
      var twoDigitHash = hash.toRadixString(16);
      while (twoDigitHash.length < 2) {
        twoDigitHash = "0$twoDigitHash";
      }
      hexHash = hexHash + twoDigitHash;
    }

    return hexHash;
  }

  void reset(Coor firstSquare) {
    map.map[firstSquare] = "X";
    for (var d in firstSquare.neighbours(diagonal: false)) {
      if (map.map[d] == "1") reset(d);
    }
  }
}

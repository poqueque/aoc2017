import '../aoc2017.dart';

class Day10 extends Day {
  @override
  bool get completed => true;

  int N = 256;

  @override
  part1() {
    var skipSize = 0;
    List<int> data = List.generate(N, (index) => index);
    var inputIntList = inputString.split(",").map((e) => int.parse(e)).toList();
    var initPointer = 0;
    for (int i in inputIntList) {
      var newData = <int>[];
      for (int k = i; k < N; k++) {
        newData.add(data[k]);
      }
      for (int k = i - 1; k >= 0; k--) {
        newData.add(data[k]);
      }
      //skip size
      data.clear();
      for (int k = skipSize; k < N; k++) {
        data.add(newData[k]);
      }
      for (int k = 0; k < skipSize; k++) {
        data.add(newData[k]);
      }
      initPointer = (initPointer - i - skipSize) % N;
      skipSize++;
    }
    var first = data[initPointer];
    var second = data[(initPointer + 1) % N];
    return first * second;
  }

  @override
  part2() {
    var skipSize = 0;
    List<int> data = List.generate(N, (index) => index);
    var inputIntList = inputString.runes.toList();
    inputIntList.addAll([17, 31, 73, 47, 23]);
    var initPointer = 0;
    for (int round = 0; round < 64; round++) {
      for (int i in inputIntList) {
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

}

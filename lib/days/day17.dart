import '../aoc2017.dart';

class Day17 extends Day {
  @override
  bool get completed => true;

  @override
  part1() {
    List<int> buffer = [0];
    int pointer = 0;
    int step = 316;
    for (int i = 1; i <= 2017; i++) {
      pointer = (pointer + step) % buffer.length;
      buffer.insert(pointer + 1, i);
      pointer++;
//      print (buffer);
    }
    return buffer[(pointer + 1) % buffer.length];
  }

  @override
  part2() {
    int pointer = 0;
    int after0 = 0;
    int l = 1;
    int step = 316;
    for (int i = 1; i <= 50000000; i++) {
      pointer = (pointer + step) % l;
      if (pointer == 0) {
        after0 = i;
      }
      l++;
      pointer++;
    }
    return after0;
  }
}

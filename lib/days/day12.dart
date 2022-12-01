import '../aoc2017.dart';

class Day12 extends Day {
  @override
  bool get completed => true;

  Map<String, List<String>> data = {};

  init() {
    for (var element in inputList) {
      var parts = element.split(" ").map((e) => e.replaceAll(",", "")).toList();
      data[parts[0]] = [parts[2]];
      if (parts.length > 3) data[parts[0]]!.add(parts[3]);
      if (parts.length > 4) data[parts[0]]!.add(parts[4]);
      if (parts.length > 5) data[parts[0]]!.add(parts[5]);
      if (parts.length > 6) data[parts[0]]!.add(parts[6]);
      if (parts.length > 7) data[parts[0]]!.add(parts[7]);
      if (parts.length > 8) data[parts[0]]!.add(parts[8]);
      if (parts.length > 9) data[parts[0]]!.add(parts[9]);
      if (parts.length > 10) data[parts[0]]!.add(parts[10]);
      if (parts.length > 11) data[parts[0]]!.add(parts[11]);
    }
  }

  @override
  part1() {
    init();
    var zeroReach = ["0"];
    var pointer = 0;
    while (zeroReach.length > pointer) {
      for (var element in data[zeroReach[pointer]]!) {
        if (!zeroReach.contains(element)) {
          zeroReach.add(element);
        }
      }
      pointer++;
    }
    return zeroReach.length;
  }

  @override
  part2() {
    init();
    var groups = 0;
    while (data.isNotEmpty) {
      List<String> zeroReach = [data.keys.first];
      var pointer = 0;
      while (zeroReach.length > pointer) {
        for (var element in data[zeroReach[pointer]]!) {
          if (!zeroReach.contains(element)) {
            zeroReach.add(element);
          }
        }
        pointer++;
      }
      for (var e in zeroReach) {
        data.remove(e);
      }
      groups++;
    }
    return groups;
  }
}

import '../aoc2017.dart';

class Day16 extends Day {
  @override
  bool get completed => true;
  var p = "abcdefghijklmnop";

  @override
  part1() {
    var steps = inputString.split(",");
    for (var step in steps) {
      dance(step);
    }
    return p;
  }

  @override
  part2() {
    p = "abcdefghijklmnop";
    List<String> d = [];
    var steps = inputString.split(",");
    d.add(p);

    // ignore: unused_local_variable
    bool printed = false;
    var loop = 1000000000;
    for (int i = 0; i < loop; i++) {
      for (var step in steps) {
        dance(step);
      }
      if (d.contains(p)) {
        var period = i - d.indexOf(p) + 1;
//        if (!printed) print ("String $p is on position ${d.indexOf(p)} - i: $i - period: $period");
        var total = d.indexOf(p) + loop % period;
//        if (!printed) print ("Deberia ser = ${d[total]}");
        printed = true;
        return d[total];
      }
      d.add(p);
    }
    return p;
  }

  void dance(String step) {
    if (step[0] == "s") {
      var moves = int.parse(step.substring(1));
      p = p.substring(p.length - moves) + p.substring(0, p.length - moves);
    }
    if (step[0] == "x") {
      var data = step.substring(1).split("/");
      var p1 = int.parse(data[0]);
      var p2 = int.parse(data[1]);
      var s1 = p[p1];
      var s2 = p[p2];
      p = p.replaceAll(s1, "z");
      p = p.replaceAll(s2, s1);
      p = p.replaceAll("z", s2);
    }
    if (step[0] == "p") {
      var data = step.substring(1).split("/");
      var s1 = data[0];
      var s2 = data[1];
      p = p.replaceAll(s1, "z");
      p = p.replaceAll(s2, s1);
      p = p.replaceAll("z", s2);
    }
  }
}

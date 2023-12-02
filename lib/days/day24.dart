
import '../aoc2017.dart';

class Day24 extends Day {
  @override
  bool get completed => true;

  List<Connector> connectors = [];

  init() {
    for (var line in inputList) {
      var parts = line.split("/");
      var a = int.parse(parts[0]);
      var b = int.parse(parts[1]);
      connectors.add(Connector(a, b));
    }
  }

  @override
  part1() {
    init();
    return getMaxConnector(connectors, 0);
  }

  @override
  part2() {
    return getStrength(getLongestConnector(connectors, [], 0));
  }

  getMaxConnector(List<Connector> connectors, int i) {
    var max = 0;
    for (var c in connectors) {
      if (c.canConnect(i)) {
        var newConnectors = connectors.toList();
        newConnectors.remove(c);
        var newMax = getMaxConnector(newConnectors, c.a == i ? c.b : c.a) + c.a + c.b;
        if (newMax > max) max = newMax;
      }
    }
    return max;
  }

  getLongestConnector(List<Connector> remainingConnectors, List<Connector> currentConnectors, int i) {
    List<Connector> maxChain = [];
    var maxStrength = 0;
    var maxLength = 0;
    for (var c in remainingConnectors) {
      if (c.canConnect(i)) {
        var newRemainingConnectors = remainingConnectors.toList();
        newRemainingConnectors.remove(c);
        var newCurrentConnectors = currentConnectors.toList();
        newCurrentConnectors.add(c);
        var newMaxChain = getLongestConnector(newRemainingConnectors, newCurrentConnectors, c.a == i ? c.b : c.a);
        if (newMaxChain.length > maxLength){
          maxChain = newMaxChain;
          maxLength = newMaxChain.length;
          maxStrength = getStrength(newMaxChain);
        } else if (newMaxChain.length == maxLength && getStrength(newMaxChain) > maxStrength){
          maxChain = newMaxChain;
          maxStrength = getStrength(newMaxChain);
        }
      }
    }
    if (maxChain.isEmpty) maxChain = currentConnectors.toList();
    return maxChain;
  }


  int getStrength(List<Connector> connectors) {
    var strength = 0;
    for (var c in connectors) {
      strength += c.a + c.b;
    }
    return strength;
  }
}

class Connector {

  int a;
  int b;

  Connector(this.a, this.b);

  @override
  String toString() {
    return "$a/$b";
  }

  bool canConnect(int x) {
    return a == x || b == x;
  }
}
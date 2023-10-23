
import '../aoc2017.dart';
import '../utils/coor3.dart';

class Day20 extends Day {
  @override
  bool get completed => true;

  Map<int,Particle> particles = {};

  @override
  part1() {
    var c =0;
    for (var i in inputList) {
      particles[c]= Particle(i);
      c++;
    }
    var stability = 0;
    var lastClosest = 0;
    while (true) {
      var i = closestParticle();
//      print("particle $i is closest");
      for (var p in particles.values) {
        p.vel += p.acc;
        p.pos += p.vel;
      }
      if (i == lastClosest) {
        stability++;
      } else {
        stability = 0;
      }
      lastClosest = i;
      if (stability > 1000) {
        break;
      }
    }
    return lastClosest;
  }

  @override
  part2() {
    var c =0;
    for (var i in inputList) {
      particles[c]= Particle(i);
      c++;
    }
    var stability = 0;
    var lastClosest = 0;
    while (true) {
      var i = closestParticle();
//      print("particle $i is closest");
      for (var p in particles.values) {
        p.vel += p.acc;
        p.pos += p.vel;
      }
      if (i == lastClosest) {
        stability++;
      } else {
        stability = 0;
      }
      lastClosest = i;
      if (stability > 1000) {
        break;
      }
      removeCollisions();
    }
    return particles.length;
  }

  int closestParticle() {
    var min = 1000000000000;
    var minIndex = -1;
    for (var key in particles.keys){
      var distance = particles[key]!.pos.manhattanDistance(Coor3(0,0,0));
      if (distance < min){
        min = distance;
        minIndex = key;
      }
    }
    return minIndex;
  }

  void removeCollisions() {
    var toRemove = <int>[];
    for (var p0 in particles.keys) {
      for (var p1 in particles.keys) {
        if (p0 != p1 && particles[p0]!.pos == particles[p1]!.pos) {
          toRemove.add(p0);
          toRemove.add(p1);
        }
      }
    }
    particles.removeWhere((key, value) => toRemove.contains(key));
  }
}

class Particle {
  late Coor3 pos;
  late Coor3 vel;
  late Coor3 acc;

  Particle(String inputLine){
    var parts = inputLine.split(", ");
    var posParts = parts[0].split("<")[1].split(">");
    var velParts = parts[1].split("<")[1].split(">");
    var accParts = parts[2].split("<")[1].split(">");
    pos = Coor3.fromString(posParts[0]);
    vel = Coor3.fromString(velParts[0]);
    acc = Coor3.fromString(accParts[0]);
  }
}
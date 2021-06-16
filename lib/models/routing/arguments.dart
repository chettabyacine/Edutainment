import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/models/classes/LevelAnimals.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/classes/LevelGeometry.dart';

class Arguments {
  final DomainNames domain;
  final int stars;
  final LevelCalculs levelCalculs;
  final LevelAnimals levelAnimals;
  final LevelGeometry levelGeometry;
  Arguments(
      {this.domain,
      this.stars,
      this.levelCalculs,
      this.levelAnimals,
      this.levelGeometry});
}

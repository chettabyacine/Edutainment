import 'package:edutainment/models/classes/Domain.dart';
import 'package:flutter/material.dart';

class Arguments {
  final Domain domain;
  final int indexOfLevel;
  final int score;
  List<Icon> list;
  final bool failed;
  Arguments(
      {@required this.domain,
      @required this.indexOfLevel,
      @required this.score,
      @required this.list,
      this.failed});
}

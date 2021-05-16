import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/material.dart';

enum DomainNames { calculs, animals, geometry, evaluation }
Map<DomainNames, int> domainIndex = {
  DomainNames.calculs: 1,
  DomainNames.animals: 2,
  DomainNames.geometry: 3,
  DomainNames.evaluation: 4,
};

Map<DomainNames, String> domainString = {
  DomainNames.calculs: 'Calculs',
  DomainNames.animals: 'Animals',
  DomainNames.geometry: 'Géométrie',
  DomainNames.evaluation: 'Evaluation',
};

Map<DomainNames, Color> domainColor = {
  DomainNames.calculs: kBlueColor,
  DomainNames.animals: kYellowColor,
  DomainNames.geometry: kGreenColor,
  DomainNames.evaluation: kRedColor,
};

List<Color> gradientCalculs = [
  Color(0xFF1490F5),
  Color(0xFF127FD7),
  Color(0xFF075391),
];

List<Color> gradientanimals = [
  Color(0xFFEDAE1D),
  Color(0xFFEDAE1D),
  Color(0xC56B6105),
];

List<Color> gradientgeometry = [
  Color(0xFF2CBAA4),
  Color(0xFF239e8b),
  Color(0xFF1a7364),
];

Map<DomainNames, List<Color>> scoreColor = {
  DomainNames.calculs: gradientCalculs,
  DomainNames.animals: gradientanimals,
  DomainNames.geometry: gradientgeometry,
};

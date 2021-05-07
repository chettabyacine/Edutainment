import 'package:edutainment/models/Domain.dart';
import 'package:flutter/material.dart';

enum DomainNames { calculs, geometry, animals, evaluation }

Map<DomainNames, int> domainIndex = {
  DomainNames.calculs: 1,
  DomainNames.animals: 2,
  DomainNames.geometry: 3,
  DomainNames.evaluation: 4,
};

Map<DomainNames,String> domainString = {
  DomainNames.calculs: 'Calculs',
  DomainNames.animals: 'Animals',
  DomainNames.geometry: 'Géométrie',
  DomainNames.evaluation: 'Evaluation',
};

Map<DomainNames,Color> domainColor={
  DomainNames.calculs: Color(0xff1490F5),
  DomainNames.animals: Color(0xffEDAE1D),
  DomainNames.geometry: Color(0xff2CBAA4),
  DomainNames.evaluation: Color(0xffFF6868),
};

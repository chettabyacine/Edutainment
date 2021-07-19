import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/routing/arguments.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/geometry_animals_game/level1/LevelGeometryOrAnimals.dart';
import 'package:edutainment/screens/geometry_animals_game/page.dart';
import 'package:edutainment/screens/log_in/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/screens/congratulation/page.dart';

class WidgetJouerMaintenantButton extends StatelessWidget {
  final Domain domain;
  final int indexOfLevel;
  final bool isScorePage;
  final bool goToCongratulations;
  final bool failed;

  WidgetJouerMaintenantButton(
      {this.domain,
      this.indexOfLevel,
      @required this.isScorePage,
      @required this.goToCongratulations,
      @required this.failed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(0.0),
      color: domainColor[domain.getname()],
      child: MaterialButton(
        minWidth: 130.0,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Arguments args;
          if (isScorePage) {
            if (goToCongratulations) {
              Navigator.pushNamed(context, PageCongratulation.getPageName());
            } else {
              if (domain.getlevels().length > indexOfLevel + 1) {
                if (failed) {
                  if (domain.getname() == DomainNames.geometry ||
                      domain.getname() == DomainNames.animals) {
                    (domain.getlevels().elementAt(indexOfLevel) as LevelGeometryOrAnimals)
                        .remainingLives = 3;
                    (domain.getlevels().elementAt(indexOfLevel) as LevelGeometryOrAnimals)
                        .currentScore = 0;
                    args = Arguments(
                        domain: domain,
                        indexOfLevel: indexOfLevel,
                        score: 0,
                        list: []);
                  } else {
                    (domain.getlevels().elementAt(indexOfLevel) as LevelCalculs)
                        .currentScore = 0;
                  }
                } else {
                  domain.incrementLevelIndex();
                  args = Arguments(
                      domain: domain,
                      indexOfLevel: indexOfLevel + 1,
                      score: 0,
                      list: []);
                }
                Navigator.pushNamed(
                  context,
                  domain.getname() == DomainNames.calculs
                      ? PageCalculsGame.getPageName()
                      : PageLevelAnimalsOrGeometry.getPageName(),
                  arguments: args,
                );
              }
            }
          }
        },
        child: Text(
          'Jouer maintenant!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Acme',
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}

import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/routing/arguments.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/geometry_animals_game/page.dart';
import 'package:edutainment/screens/question_qcm_text_text/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/DomainNames.dart';

class WidgetJouerMaintenantButton extends StatelessWidget {
  final Domain domain;
  final int indexOfLevel;
  final bool isScorePage;
  WidgetJouerMaintenantButton(
      {this.domain, this.indexOfLevel, @required this.isScorePage});
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
          if (isScorePage) {
            domain.incrementLevelIndex();
          }
          Arguments args =
              Arguments(domain: domain, indexOfLevel: indexOfLevel + 1);
          Navigator.pushNamed(
            context,
            domain.getname() == DomainNames.calculs
                ? PageCalculsGame.getPageName()
                : PageLevelAnimalsOrGeometry.getPageName(),
            arguments: args,
          );
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

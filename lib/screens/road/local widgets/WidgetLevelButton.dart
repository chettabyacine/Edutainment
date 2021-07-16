import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/routing/arguments.dart';
import 'package:edutainment/screens/geometry_animals_game/page.dart';
import 'package:edutainment/screens/home/page.dart';
import 'package:edutainment/screens/score/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/utils/enums.dart';
import 'package:edutainment/screens/calculs_game/page.dart';

class LevelButton extends StatelessWidget {
  final int levelNumber;
  final bool isOnTheRight;
  final LevelStates state;
  final Widget bottom;
  final Domain domain;
  final int stars;

  LevelButton(
      {this.levelNumber,
      this.isOnTheRight,
      this.bottom,
      this.domain,
      this.state,
      this.stars});

  @override
  Widget build(BuildContext context) {
    final Arguments args = Arguments(
        domain: domain, indexOfLevel: levelNumber, list: [], score: 0);
    final Domain domainArgument = args.domain;
    return Column(
      crossAxisAlignment:
          isOnTheRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            if (state == LevelStates.passed)
              Navigator.pushNamed(context, PageScore.getPageName(),
                  arguments: args);
            else {
              if (state == LevelStates.current)
                Navigator.pushNamed(
                  context,
                  domainArgument.getname() == DomainNames.calculs
                      ? PageCalculsGame.getPageName()
                      : ((domainArgument.getname() == DomainNames.geometry ||
                              domainArgument.getname() == DomainNames.animals)
                          ? PageLevelAnimalsOrGeometry.getPageName()
                          : PageHome.getPageName()),
                  arguments: args,
                );
            }
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: state == LevelStates.passed
                ? domainColor[domainArgument.getname()]
                : Colors.grey,
            side: state == LevelStates.current
                ? BorderSide(
                    width: 3, color: domainColor[domainArgument.getname()])
                : null,
          ),
          child: Text('${levelNumber + 1}'),
        ),
        this.bottom,
      ],
    );
  }
}

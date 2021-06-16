import 'package:edutainment/models/routing/arguments.dart';
import 'package:edutainment/screens/score/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/utils/enums.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/question_qcm_text_text/page.dart';
import 'package:edutainment/screens/question_qcm_text_image/page.dart';
import 'package:edutainment/screens/question_qcm_image_text/page.dart';

class LevelButton extends StatelessWidget {
  final int levelNumber;
  final bool isOnTheRight;
  final LevelStates state;
  final Widget bottom;
  final DomainNames domain;
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
    final Arguments args = Arguments(domain: domain, stars: stars);
    final int starsArgument = args.stars;
    final DomainNames domainArgument = args.domain;
    return Column(
      crossAxisAlignment:
          isOnTheRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            if (state == LevelStates.passed)
              Navigator.pushNamed(context, PageScore.getPageName(),
                  arguments: args);
            else if (state == LevelStates.current)
              Navigator.pushNamed(
                context,
                domainArgument == DomainNames.calculs
                    ? PageCalculsGame.getPageName()
                    : PageQuestionQcmTextText.getPageName(),
                arguments: args,
              );
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: state == LevelStates.passed
                ? domainColor[domainArgument]
                : Colors.grey,
            side: state == LevelStates.current
                ? BorderSide(width: 3, color: domainColor[domainArgument])
                : null,
          ),
          child: Text('${levelNumber}'),
        ),
        this.bottom,
      ],
    );
  }
}

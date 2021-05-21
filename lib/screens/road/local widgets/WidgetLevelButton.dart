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

  LevelButton(
      {this.levelNumber,
      this.isOnTheRight,
      this.state,
      this.bottom,
      this.domain});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isOnTheRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            if (state == LevelStates.passed)
              Navigator.pushNamed(context, PageScore.getPageName(),
                  arguments: domain);
            else if (state == LevelStates.current)
              Navigator.pushNamed(
                context,
                domain == DomainNames.calculs
                    ? PageCalculsGame.getPageName()
                    : PageQuestionQcmTextText.getPageName(),
                arguments: domain,
              );
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary:
                state == LevelStates.passed ? domainColor[domain] : Colors.grey,
            side: state == LevelStates.current
                ? BorderSide(width: 3, color: domainColor[domain])
                : null,
          ),
          child: Text('${levelNumber}'),
        ),
        this.bottom,
      ],
    );
  }
}

import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/question_qcm_image_text/page.dart';
import 'package:edutainment/screens/question_qcm_text_image/page.dart';
import 'package:edutainment/screens/question_qcm_text_text/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/DomainNames.dart';

class WidgetJouerMaintenantButton extends StatelessWidget {
  final DomainNames domain;
  WidgetJouerMaintenantButton({this.domain});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(0.0),
      color: domainColor[domain],
      child: MaterialButton(
        minWidth: 130.0,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //TODO : implement navigation (islam)
          Navigator.pushNamed(
            context,
            domain == DomainNames.calculs
                ? PageCalculsGame.getPageName()
                : PageQuestionQcmTextText.getPageName(),
            arguments: domain,
          );
        }, //TODO : implement navigation (islam)
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

import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/classes/QuestionCalculs.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/road/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/screens/road/page.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Color colour;
  final SvgPicture icon;
  final Domain domain;
  HomeButton({this.text, this.colour, this.icon, @required this.domain});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (text) {
          case 'Calculs':
            domain.setname(DomainNames.calculs);
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: domain,
            );

            break;
          case 'Géométrie':
            domain.setname(DomainNames.geometry);
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: domain,
            );
            break;
          case 'Animaux':
            domain.setname(DomainNames.animals);
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: domain,
            );
            break;
          case 'Evaluation':
            domain.setname(DomainNames.evaluation);
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: domain,
            );
            break;
          default:
            break;
        }
      },
      child: Container(
        height: 135,
        width: 135,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 1.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 15.0),
            Text(
              text,
              style: kHomeButtonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

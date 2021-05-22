import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/road/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Color colour;
  final SvgPicture icon;
  HomeButton({this.text, this.colour, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (text) {
          case 'Calculs':
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: DomainNames.calculs,
            );

            break;
          case 'Géométrie':
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: DomainNames.geometry,
            );
            break;
          case 'Animaux':
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: DomainNames.animals,
            );
            break;
          case 'Evaluation':
            Navigator.pushNamed(
              context,
              PageRoad.getPageName(),
              arguments: DomainNames.evaluation,
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

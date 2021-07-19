import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import 'package:edutainment/screens/home/page.dart';

class PageCongratulation extends StatefulWidget {
  static const String _pageName = kPageCongratulation;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageCongratulationState createState() => _PageCongratulationState();
}

class _PageCongratulationState extends State<PageCongratulation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: kVioletColor,
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 500.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image(
                  image: AssetImage('assets/Rectangle 50.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 400, 0, 0),
                child: Image(
                  image: AssetImage('assets/Ellipse 1.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(100, 450, 0, 0),
                child: Text(
                  'Félicitations',
                  style: TextStyle(
                    fontSize: 40,
                    color: kVioletColor,
                    fontFamily: 'Acme',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(120, 505, 0, 0),
                child: Text(
                  'Vous avez fini le jeu!',
                  style: TextStyle(
                    fontSize: 20,
                    color: kVioletColor,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(85, 530, 0, 0),
                child: Text(
                  'Les autres jeux vous attendent..',
                  style: TextStyle(
                    fontSize: 20,
                    color: kVioletColor,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: TextButton(
                  child: Text(
                    "Aller vers l'accueil",
                    style: TextStyle(
                      fontFamily: 'Acme',
                      fontSize: 22.0,
                      color: kVioletColor,
                      fontWeight: kFontWeight1,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageHome()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

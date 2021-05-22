import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/question_qcm_text_image/page.dart';
import 'package:edutainment/screens/question_qcm_text_text/page.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import '../../widgets/WidgetAppBarDomain.dart';

class PageScore extends StatefulWidget {
  static const String _pageName = kPageNameScore;

  static String getPageName() {
    return _pageName;
  }

  @override
  _PageScoreState createState() => _PageScoreState();
}

class _PageScoreState extends State<PageScore> {
  //TODO: MAKE LIST DYNAMIC
  List<Icon> ScoreList =
      kIcons; //TODO: elle est dans les constantes !! à supprimer !! (yacine)

  @override
  Widget build(BuildContext context) {
    final DomainNames domain = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background 1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDomain(
                title: "Calculs", //TODO: to change
                height: kHeightAppBar,
                domain: 1,
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), //TODO: changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.3,
                      0.6,
                      0.9,
                    ],
                    colors: [
                      Color(0xFF1490F5),
                      Color(0xFF127FD7),
                      Color(0xC5062137),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.lightBlueAccent, //TODO: to change
                ),
                width: 300.0,
                height: 180.0,
                child: Column(
                  children: [
                    Text(
                      'Votre Score est :',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //TODO: CREATE METHOD RETURN THE STARS OF SCORE
                        SvgPicture.asset('assets/star full.svg'),
                        SvgPicture.asset('assets/star full.svg'),
                        SvgPicture.asset('assets/star full.svg'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Bien joué !! Vous avez pu répondre à 13 questions correctement dans 30 seconds.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: Wrap(
                  children: ScoreList,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(0.0),
          color: Color(0xff1490F5),
          child: MaterialButton(
            minWidth: 130.0,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              //TODO : WHEN WE PRESS THE BUTTON WE MOVE TO ANOTHER PAGE
              Navigator.pushNamed(
                context,
                domain == DomainNames.calculs
                    ? PageCalculsGame.getPageName()
                    : PageQuestionQcmTextText.getPageName(),
                arguments: domain,
              );
            },
            child: Text(
              "Continuer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Acme',
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

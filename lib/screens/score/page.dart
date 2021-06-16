import 'package:edutainment/models/routing/arguments.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/question_qcm_text_image/page.dart';
import 'package:edutainment/screens/question_qcm_text_text/page.dart';
import 'package:edutainment/screens/road/page.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/widgets/WidgetJouerMaintenantButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import '../../widgets/WidgetAppBarDomain.dart';
import 'package:edutainment/widgets/WidgetAppBarDynamic.dart';

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
    final Arguments args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background ${domainIndex[args.domain]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDynamic(
                title: domainString[args.domain], // to change
                height: 135.0,
                domaine: domainIndex[args.domain],
              ),
              /******************* */
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
                      scoreColor[args.domain][0],
                      scoreColor[args.domain][1],
                      scoreColor[args.domain][2],
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
                    if (args.stars == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if (args.stars == 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if (args.stars == 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if (args.stars == 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
        bottomNavigationBar: WidgetJouerMaintenantButton(
          domain: args.domain,
        ),
      ),
    );
  }
}

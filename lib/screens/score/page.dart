import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/routing/arguments.dart';
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
  List<String> scoreMessage = [
    "Mal joué",
    "Vous pouvez vous amélioter",
    "Bien joué",
    "Vous êtes excellent",
    "ERREUR"
  ];
  @override
  Widget build(BuildContext context) {
    final Arguments args =
        ModalRoute.of(context).settings.arguments as Arguments;
    int numberOfStars;
    if (args.score < 3) numberOfStars = 0;
    if (3 <= args.score && args.score < 6) numberOfStars = 1;
    if (6 <= args.score && args.score < 9) numberOfStars = 2;
    if (9 <= args.score) numberOfStars = 3;
    print("number of stars = ${numberOfStars}");
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background ${domainIndex[args.domain.getname()]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDynamic(
                title: domainString[args.domain.getname()], // to change
                height: 135.0,
                domaine: domainIndex[args.domain.getname()],
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
                    colors: scoreColor[args.domain.getname()],
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
                    if (args.score < 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if (3 <= args.score && args.score < 6)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if (6 <= args.score && args.score < 9)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if (9 <= args.score)
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
                      args.domain.getname() == DomainNames.calculs
                          ? "${scoreMessage[numberOfStars]} !! Vous avez pu répondre à ${args.score} questions correctement dans ${((args.domain.getlevels().elementAt(args.indexOfLevel)) as LevelCalculs).getDuration() ~/ 1000} seconds."
                          : "${scoreMessage[numberOfStars]} !! Vous avez pu répondre à ${args.score} questions correctement!",
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
                  children: args.list,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: WidgetJouerMaintenantButton(
          domain: args.domain,
          indexOfLevel: args.indexOfLevel,
          isScorePage: true,
          goToCongratulations:
              (args.domain.getlevels().length <= args.indexOfLevel + 1),
          failed: args.failed,
        ),
      ),
    );
  }
}

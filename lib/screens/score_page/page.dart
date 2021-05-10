import 'package:edutainment/models/DomainNames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import 'package:edutainment/widgets/WidgetAppBarDynamic.dart';
import 'package:edutainment/widgets/WidgetJouerMaintenantButton.dart';

class PageScore extends StatefulWidget {
  static const String _pageName = kPageNameScore;
  @required DomainNames domain;
  @required int stars;
  PageScore({this.domain,this.stars});


  static String getPageName() {
    return _pageName;
  }

  @override
  _PageScoreState createState() => _PageScoreState();
}

class _PageScoreState extends State<PageScore> {
  //TODO: MAKE LIST DYNAMIC
  List<Icon> ScoreList = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background ${domainIndex[widget.domain]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBarDynamicWidget(
                title: domainString[widget.domain], // to change
                height: 135,
                domaine: domainIndex[widget.domain],
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
                      offset: Offset(0, 3), // changes position of shadow
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
                      scoreColor[widget.domain][0],
                      scoreColor[widget.domain][1],
                      scoreColor[widget.domain][2],
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.lightBlueAccent, // to change
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
                    if( widget.stars == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if( widget.stars == 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       SvgPicture.asset('assets/star full.svg'),
                       SvgPicture.asset('assets/star empty.svg'),
                       SvgPicture.asset('assets/star empty.svg'),
                     ],
                     ),
                    if( widget.stars == 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star full.svg'),
                          SvgPicture.asset('assets/star empty.svg'),
                        ],
                      ),
                    if( widget.stars == 3)
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
        bottomNavigationBar: WidgetJouerMaintenantButton(domain: widget.domain,),
      ),
    );
  }
}

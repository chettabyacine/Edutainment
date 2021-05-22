import 'package:edutainment/models/classes/Domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'local widgets/WidgetLevelButton.dart';
import 'package:edutainment/screens/road/local widgets/WidgetBottomText.dart';
import 'package:edutainment/screens/road/local widgets/WidgetThreeStars.dart';
import 'package:edutainment/widgets/WidgetJouerMaintenantButton.dart';
import 'package:edutainment/utils/enums.dart';

class PageRoad extends StatefulWidget {
  @required
  static const String _pageName = kPageRoad;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageRoadState createState() => _PageRoadState();
}

class _PageRoadState extends State<PageRoad> {
  //TODO : FIND A WAY TO CREATE THE ACTUAL ROAD
  List<Widget> buttonList = [];
  @override
  void initState() {
    super.initState();
    buttonList = [
      //TODO : MAKE LIST DYNAMIC (islam)
      // LevelButton(
      //   levelNumber: 1,
      //   isOnTheRight: true,
      //   bottom: ThreeStars(
      //     isOnTheRight: true,
      //     numberOfColored: 2,
      //   ),
      //   domain: widget.domain,
      // ),
      // SizedBox(
      //   height: 20,
      // ),
      // LevelButton(
      //   levelNumber: 2,
      //   isOnTheRight: false,
      //   bottom: ThreeStars(
      //     isOnTheRight: false,
      //     numberOfColored: 3,
      //   ),
      //   domain: widget.domain,
      // ),
      // SizedBox(
      //   height: 20,
      // ),
      // LevelButton(
      //   levelNumber: 3,
      //   isOnTheRight: true,
      //   bottom: BottomText(),
      //   domain: widget.domain,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final DomainNames domain = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background ${domainIndex[domain]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDomain(
                title: '${domainString[domain]}', // to change
                domain: domainIndex[domain],
                height: 140,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                  child: ListView(
                    children: [
                      LevelButton(
                        levelNumber: 1,
                        isOnTheRight: true,
                        state: LevelStates.passed,
                        bottom: ThreeStars(
                          isOnTheRight: true,
                          numberOfColored: 2,
                        ),
                        domain: domain,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LevelButton(
                        levelNumber: 2,
                        isOnTheRight: false,
                        state: LevelStates.passed,
                        bottom: ThreeStars(
                          isOnTheRight: false,
                          numberOfColored: 3,
                        ),
                        domain: domain,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LevelButton(
                        levelNumber: 3,
                        isOnTheRight: true,
                        state: LevelStates.current,
                        bottom: BottomText(
                          text: 'Vous êtes là!',
                          domain: domain,
                        ),
                        domain: domain,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LevelButton(
                        levelNumber: 4,
                        isOnTheRight: false,
                        state: LevelStates.waiting,
                        bottom: BottomText(text: ''),
                        domain: domain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //TODO: refactor the bottom button
        bottomNavigationBar: WidgetJouerMaintenantButton(domain: domain),
      ),
    );
  }
}

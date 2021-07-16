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

  Domain domain;
  PageRoad({this.domain});

  @override
  _PageRoadState createState() => _PageRoadState();
}

class _PageRoadState extends State<PageRoad> {
  //TODO : FIND A WAY TO CREATE THE ACTUAL ROAD

  List<Widget> getRoadButtons({Domain domain}) {
    List<Widget> result = [];
    Widget widget;
    const Widget sizedBox = SizedBox(height: 20);
    for (int i = 0; i < domain.getlevels().length; i++) {
      if (i < domain.getcurrentlevel()) {
        widget = LevelButton(
          levelNumber: i,
          isOnTheRight: i.isOdd,
          stars: domain.getlevels().elementAt(i).getNumbreOfStars(),
          state: LevelStates.passed,
          bottom: ThreeStars(
            isOnTheRight: i.isOdd,
            numberOfColored: domain.getlevels().elementAt(i).getNumbreOfStars(),
          ),
          domain: domain,
        );
      } else if (i == domain.getcurrentlevel()) {
        widget = LevelButton(
          levelNumber: i,
          isOnTheRight: i.isOdd,
          stars: domain.getlevels().elementAt(i).getNumbreOfStars(),
          state: LevelStates.current,
          bottom: ThreeStars(
            isOnTheRight: i.isOdd,
            numberOfColored: 0,
          ),
          domain: domain,
        );
      }
      if (i > domain.getcurrentlevel()) {
        widget = LevelButton(
          levelNumber: i,
          isOnTheRight: i.isOdd,
          state: LevelStates.waiting,
          bottom: BottomText(text: ''),
          domain: domain,
        );
      }
      result.add(widget);
      result.add(sizedBox);
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Domain domain = ModalRoute.of(context).settings.arguments as Domain;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background ${domainIndex[domain.getname()]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDomain(
                title: '${domainString[domain.getname()]}', // to change
                domain: domainIndex[domain.getname()],
                height: 140,
                isHome: false,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                  child: ListView(
                    children: getRoadButtons(domain: domain),
                  ),
                ),
              ),
            ],
          ),
        ),
        //TODO: refactor the bottom button
        bottomNavigationBar: WidgetJouerMaintenantButton(
          domain: domain,
          indexOfLevel: domain.getcurrentlevel(),
          isScorePage: false,
          failed: false,
          goToCongratulations:
              (domain.getlevels().length == domain.getcurrentlevel()),
        ),
      ),
    );
  }
}

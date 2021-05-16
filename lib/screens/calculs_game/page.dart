import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'local_widgets/WidgetCalculsAnswerBox.dart';
import 'local_widgets/WidgetCalculsTheNumberBox.dart';
import 'package:edutainment/models/data_state_managment/DataCalculsGame.dart';

// ignore: must_be_immutable
class PageCalculsGame extends StatelessWidget {
  static const String _pageName = kPageCalculsGame;
  LevelCalculs levelCalculs;
  PageCalculsGame({this.levelCalculs});

  static String getPageName() {
    return _pageName;
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataCalculsGame>(
      create: (context) => DataCalculsGame(levelCalculs: levelCalculs),
      child: WidgetPageCalculsGame(),
    );
  }
}

/** ****************************************/

class WidgetPageCalculsGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataCalculsGame>(context);
    Widget WidgetTimeBar({LevelCalculs level}) {
      return LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 100,
        animation: true,
        alignment: MainAxisAlignment.center,
        animationDuration: level.getDuration(),
        lineHeight: 16.0,
        percent: 1,
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Color(0xffE4B94A),
        backgroundColor: Color(0x10000000),
        restartAnimation: true,
        onAnimationEnd: () {
          //todo: level ends
          Navigator.pop(context);
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background math.svg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WidgetAppBarDomain(
                domain: 1,
                title: "Calculs",
                height: kHeightAppBar,
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              WidgetTimeBar(
                level: data.levelCalculs,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Score: ${data.getCurrentScore()}",
                    ),
                    Text(
                      "${data.getNumberOfStars()}",
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                          offset: Offset(0.0, 1))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: WidgetCalculsTheNumberBox(
                            number: data.currentQuestion().getNumberA(),
                          ),
                        ),
                        Expanded(
                          child: WidgetCalculsAnswerBox(),
                        ),
                        Expanded(
                          child: WidgetCalculsTheNumberBox(
                            number: data.currentQuestion().getNumberB(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: SvgPicture.asset('assets/bien joue.svg'),
                  alignment: Alignment.centerRight,
                ),
                flex: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

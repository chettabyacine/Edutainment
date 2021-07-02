import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/Level.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/routing/arguments.dart';
import 'package:edutainment/screens/score/page.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/classes/DomainNames.dart';

class PageCalculsGame extends StatefulWidget {
  static const String _pageName = kPageCalculsGame;

  static String getPageName() {
    return _pageName;
  }

  @override
  _PageCalculsGameState createState() => _PageCalculsGameState();
}

class _PageCalculsGameState extends State<PageCalculsGame> {
  LevelCalculs levelCalculs;
  int currentIndex = 0;
  Widget photo = SvgPicture.asset('assets/bird.svg');

  Widget build(BuildContext context) {
    final Arguments args =
        ModalRoute.of(context).settings.arguments as Arguments;
    levelCalculs = args.domain.getlevels()[args.domain.getcurrentlevel()];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background 1.jpg'),
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
                isHome: false,
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              WidgetTimeBar(
                domain: args.domain,
                indexOfLevel: args.indexOfLevel,
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
                      "Score: ${levelCalculs.getCurrentScore()}",
                      style: TextStyle(color: Colors.teal),
                    ),
                    Row(
                      children: [
                        Container(),
                      ],
                      // children: levelCalculs.getStars(),
                    )
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
                        WidgetNumber(
                            number:
                                levelCalculs.currentQuestion().getNumberA()),
                        WidgetAnswerButton(),
                        WidgetNumber(
                            number:
                                levelCalculs.currentQuestion().getNumberB()),
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
                  child: photo,
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

  /****************************************************** */
  /** WIDGETS */
  /** **************************************************** */

  Widget WidgetTimeBar({@required Domain domain, @required int indexOfLevel}) {
    LevelCalculs level = domain.getlevels().elementAt(indexOfLevel);
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
      onAnimationEnd: () {
        Arguments args = Arguments(domain: domain, indexOfLevel: indexOfLevel);
        Navigator.pushNamed(context, PageScore.getPageName(), arguments: args);
      },
    );
  }

  Expanded WidgetAnswerButton() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetTextButton(userAnswer: AnswerCalculs.less, text: '<'),
                WidgetTextButton(userAnswer: AnswerCalculs.equals, text: '='),
                WidgetTextButton(userAnswer: AnswerCalculs.greater, text: '>'),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }

  Container WidgetTextButton(
      {@required AnswerCalculs userAnswer, @required String text}) {
    return Container(
      child: TextButton(
        onPressed: () {
          if (levelCalculs.getWaitingQuestions() == null ||
              levelCalculs.getWaitingQuestions().isEmpty)
            return;
          else {
            setState(() {
              levelCalculs.currentQuestion().setUserAnswerCalculs(userAnswer);
              if (userAnswer ==
                  levelCalculs.currentQuestion().getCorrectAnswer()) {
                if (levelCalculs.getWaitingQuestions().length - 1 >
                    currentIndex) {
                  levelCalculs.nextQuestion();
                  levelCalculs
                      .setCurrentScore(levelCalculs.getCurrentScore() + 1);
                }
              } else {
                if (levelCalculs.getWaitingQuestions().length - 1 >
                    currentIndex) {
                  levelCalculs.nextQuestion();
                }
              }
              currentIndex++;
              //levelCalculs.computeStars();
            });
          }
        },
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.6,
          style: BorderStyle.solid,
          color: kBlueColor,
        ),
      ),
    );
  }

  Expanded WidgetNumber({@required String number}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffD0E5F7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kBlueColor,
                    width: 1.6,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  number,
                  style: TextStyle(
                    color: kBlueColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

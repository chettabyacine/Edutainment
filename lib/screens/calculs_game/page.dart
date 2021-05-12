import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/classes/QuestionCalculs.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PageCalculsGame extends StatefulWidget {
  static const String _pageName = kPageCalculsGame;
  LevelCalculs levelCalculs;
  PageCalculsGame({this.levelCalculs});

  static String getPageName() {
    return _pageName;
  }

  @override
  _PageCalculsGameState createState() => _PageCalculsGameState();
}

class _PageCalculsGameState extends State<PageCalculsGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background math.jpg"),
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
                level: widget.levelCalculs,
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
                      "Score: ${widget.levelCalculs.getCurrentScore()}",
                    ),
                    Text(
                      "data2",
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
                            number: widget.levelCalculs
                                .getWaitingQuestions()
                                .first
                                .getNumberA(),
                          ),
                        ),
                        Expanded(
                          child: WidgetCalculsAnswerBox(
                            level: widget.levelCalculs,
                          ),
                        ),
                        Expanded(
                          child: WidgetCalculsTheNumberBox(
                            number: widget.levelCalculs
                                .getWaitingQuestions()
                                .first
                                .getNumberA(),
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
}

class WidgetCalculsAnswerBox extends StatelessWidget {
  final LevelCalculs level;

  const WidgetCalculsAnswerBox({@required this.level});
  @override
  Widget build(BuildContext context) {
    return Column(
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
              WidgetCalculsAnswerButton(
                text: ">",
                level: level,
              ),
              WidgetCalculsAnswerButton(
                text: "=",
                level: level,
              ),
              WidgetCalculsAnswerButton(
                text: "<",
                level: level,
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 10,
          ),
        ),
      ],
    );
  }
}

class WidgetCalculsTheNumberBox extends StatelessWidget {
  const WidgetCalculsTheNumberBox({
    this.number,
  });
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 5,
            child: WidgetCalculsTheNumber(
              number: number,
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class WidgetCalculsTheNumber extends StatelessWidget {
  const WidgetCalculsTheNumber({
    this.number,
  });

  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class WidgetCalculsAnswerButton extends StatefulWidget {
  WidgetCalculsAnswerButton({@required this.text, @required this.level});
  final String text;
  final LevelCalculs level;

  @override
  _WidgetCalculsAnswerButtonState createState() =>
      _WidgetCalculsAnswerButtonState();
}

class _WidgetCalculsAnswerButtonState extends State<WidgetCalculsAnswerButton> {
  AnswerCalculs userAnswer() {
    if (widget.text == "=") return AnswerCalculs.equals;
    if (widget.text == "<") return AnswerCalculs.less;
    if (widget.text == ">") return AnswerCalculs.greater;
    return AnswerCalculs.equals;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          //todo: checking the user"s anwers
          setState() {
            List<QuestionCalculs> questions =
                widget.level.getWaitingQuestions();
            QuestionCalculs question = questions.first;
            questions.removeAt(0);

            if (question.getCorrectAnswer() == userAnswer()) {
              widget.level.getCorrectlyAnswered().add(question);
              widget.level.incrementCurrentScore();
              print("bonne réponse");
            } else {
              widget.level.getIncorrectlyAnswered().add(question);
              print("mauvaise réponse");
            }
          }
        },
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Text(
          widget.text,
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
}

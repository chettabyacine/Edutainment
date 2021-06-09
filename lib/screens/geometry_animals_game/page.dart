import 'package:edutainment/models/classes/DomainNames.dart';

import 'package:flutter/material.dart';

import 'package:edutainment/widgets/WidgetAppBarDomain.dart';

import 'package:edutainment/utils/constants.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'level1/LevelBrain.dart';

LevelBrain levelBrain = LevelBrain();

int score = 0;

String userAnswer;

int remainingLives = 3;

enum Answered {
  nothing,

  correct,

  incorrect,
}

Answered answered = Answered.nothing;

class PageLevelAnimalsOrGeometry extends StatefulWidget {
  static const String _pageName = kPageLevelAnimalsOrGeometry;

  //the concept is simple i decided to create a generic page for all the questions

  //of the 2 games geometry and animals and what changes about it in each level is the

  //widget containing the question in all of its possible formats and the answer in all of its formats

  @required
  final DomainNames domain;

  PageLevelAnimalsOrGeometry({this.domain});

  @override
  _PageLevelAnimalsOrGeometryState createState() =>
      _PageLevelAnimalsOrGeometryState();

  static String getPageName() {
    return _pageName;
  }
}

class _PageLevelAnimalsOrGeometryState
    extends State<PageLevelAnimalsOrGeometry> {
  final answerInputController = TextEditingController();

  void updateScore(bool checkScore) {
    if (checkScore) {
      score++;

      answered = Answered.correct;
    } else {
      remainingLives--;

      answered = Answered.incorrect;
    }
  }

  Widget chooseAnswerWidget(bool usesInput) {
    if (!usesInput) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateScore(levelBrain
                        .questionBank[levelBrain.questionNumber]
                        .checkAnswer(0));

                    //Duration waiting = Duration(seconds: 2);

                    //sleep(waiting);

                    levelBrain.nextQuestion();
                  });
                },
                child: levelBrain
                    .questionBank[levelBrain.questionNumber].choices[0],
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(Size(130, 45)),
                    elevation: MaterialStateProperty.all<double>(6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)))),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateScore(levelBrain
                        .questionBank[levelBrain.questionNumber]
                        .checkAnswer(1));

                    levelBrain.nextQuestion();
                  });
                },
                child: levelBrain
                    .questionBank[levelBrain.questionNumber].choices[1],
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(Size(130, 45)),
                    elevation: MaterialStateProperty.all<double>(6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)))),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateScore(levelBrain
                        .questionBank[levelBrain.questionNumber]
                        .checkAnswer(2));

                    levelBrain.nextQuestion();
                  });
                },
                child: levelBrain
                    .questionBank[levelBrain.questionNumber].choices[2],
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(Size(130, 45)),
                    elevation: MaterialStateProperty.all<double>(6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)))),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateScore(levelBrain
                        .questionBank[levelBrain.questionNumber]
                        .checkAnswer(3));

                    levelBrain.nextQuestion();
                  });
                },
                child: levelBrain
                    .questionBank[levelBrain.questionNumber].choices[3],
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(Size(130, 45)),
                    elevation: MaterialStateProperty.all<double>(6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)))),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 280.0,
            child: TextField(
              controller: answerInputController,
              onChanged: (value) {
                userAnswer = value;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: 'Ecrivez votre reponse ici!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  updateScore(levelBrain.questionBank[levelBrain.questionNumber]
                      .checkAnswer(userAnswer));

                  answerInputController.clear();
                });
              },
              child: Text('Verifier!'))
        ],
      );
    }
  }

  Widget chooseBirdReaction(Answered answered) {
    if (answered == Answered.nothing) {
      return SvgPicture.asset('assets/bird.svg');
    } else if (answered == Answered.correct) {
      return SvgPicture.asset('assets/bird bien joue.svg');
    } else if (answered == Answered.incorrect) {
      return SvgPicture.asset('assets/bird mauvaise reponse.svg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background ${domainIndex[widget.domain]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDomain(
                title: domainString[widget.domain], // to change

                domain: domainIndex[widget.domain],

                height: 140,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Score: $score',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      color: domainColor[widget.domain],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: remainingLives >= 1 ? Colors.red : Colors.black,
                      ),
                      Icon(
                        Icons.favorite,
                        color: remainingLives >= 2 ? Colors.red : Colors.black,
                      ),
                      Icon(
                        Icons.favorite,
                        color: remainingLives >= 3 ? Colors.red : Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              levelBrain.questionBank[levelBrain.questionNumber].questionWidget,
              SizedBox(
                height: 60,
              ),
              chooseAnswerWidget(
                  levelBrain.questionBank[levelBrain.questionNumber].usesInput),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/bird.svg'), //TODO:FIX !!!
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

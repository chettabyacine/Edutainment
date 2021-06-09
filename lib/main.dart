import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/classes/QuestionCalculs.dart';
import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/question_qcm_image_text/page.dart';
import 'package:edutainment/screens/question_qcm_text_image/page.dart';
import 'package:edutainment/screens/question_qcm_text_text/page.dart';
import 'package:edutainment/screens/road/page.dart';
import 'package:flutter/material.dart';
import 'screens/log_in/page.dart';
import 'screens/sign_up/page.dart';
import 'screens/entry_point/page.dart';
import 'screens/home/page.dart';
import 'utils/constants.dart';
import 'utils/theme_constants.dart';
import 'screens/score/page.dart';
import 'screens/settings/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionCalculs q1 = QuestionCalculs(
        "khtaaa", 1, "numberA-1", "numberB-1", "+*", AnswerCalculs.equals);
    QuestionCalculs q2 = QuestionCalculs(
        "khs", 5, "numberA-2", "numberB-2", "+*", AnswerCalculs.equals);
    QuestionCalculs q3 = QuestionCalculs(
        "zmer", 6, "numberA-3", "numberB-3", "+*", AnswerCalculs.equals);
    QuestionCalculs q4 = QuestionCalculs(
        "zmer", 6, "numberA-4", "numberB-4", "+*", AnswerCalculs.equals);
    QuestionCalculs q5 = QuestionCalculs(
        "zmer", 6, "numberA-5", "numberB-5", "+*", AnswerCalculs.equals);
    QuestionCalculs q6 = QuestionCalculs(
        "zmer", 6, "numberA-6", "numberB-6", "+*", AnswerCalculs.equals);

    LevelCalculs leveCalculs1 = LevelCalculs(
      duration: 30000,
      color: kBlueColor,
      waitingQuestions: [
        q1,
        q2,
        q3,
        q4,
        q5,
        q6,
      ],
      currentScore: 0,
      numberOfStars: 0,
      highestScore: 2,
      currentQuestion: 0,
    ); //todo: will get this from database (yacine)

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kProjectName,
      theme: ThemeData(
        primaryColor: kVioletColor,
      ),
      initialRoute: PageEntryPoint.getPageName(),
      routes: {
        PageSignUp.getPageName(): (context) => PageSignUp(),
        PageLogIn.getPageName(): (context) => PageLogIn(),
        PageHome.getPageName(): (context) => PageHome(),
        PageEntryPoint.getPageName(): (context) => PageEntryPoint(),
        PageScore.getPageName(): (context) => PageScore(),
        PageCalculsGame.getPageName(): (context) => PageCalculsGame(),
        PageSettings.getPageName(): (context) => PageSettings(),
        PageRoad.getPageName(): (context) => PageRoad(),
        PageQuestionQcmTextText.getPageName(): (context) =>
            PageQuestionQcmTextText(),
        PageQuestionQcmImageText.getPageName(): (context) =>
            PageQuestionQcmImageText(),
        PageQuestionQcmTextImage.getPageName(): (context) =>
            PageQuestionQcmTextImage(),
      },
    );
  }
}

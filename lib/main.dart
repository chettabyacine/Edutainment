import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/Domain.dart';
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

    LevelCalculs leveCalculs1 = LevelCalculs(
      duration: 30000,
      color: kBlueColor,
      waitingQuestions: [
        q1,
        q2,
        q3,
      ],
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
        PageScore.getPageName(): (context) => PageScore(domain: DomainNames.geometry, stars: 2,),
        PageCalculsGame.getPageName(): (context) => PageCalculsGame(
              levelCalculs: leveCalculs1,
            ),
        PageSettings.getPageName(): (context) => PageSettings( email: 'ja_manaa@esi.dz', prenom: 'Adam', nom: 'Manaa',profile: Colors.blue,),
        PageRoad.getPageName(): (context) => PageRoad(),
        PageQuestionQcmTextText.getPageName(): (context) => PageQuestionQcmTextText(),
        PageQuestionQcmImageText.getPageName(): (context) => PageQuestionQcmImageText(),
        PageQuestionQcmTextImage.getPageName(): (context) => PageQuestionQcmTextImage(),
      },
    );
  }
}

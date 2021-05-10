import 'package:edutainment/models/DomainNames.dart';
import 'package:edutainment/screens/question_qcm_image_text/page.dart';
import 'package:edutainment/screens/question_qcm_text_image/page.dart';
import 'package:edutainment/screens/question_qcm_text_text//page.dart';
import 'package:edutainment/screens/road/page.dart';
import 'package:flutter/material.dart';
import 'screens/log_in/page.dart';
import 'screens/sign_up/page.dart';
import 'screens/menu_0/page.dart';
import 'screens/home/page.dart';
import 'utils/constants.dart';
import 'utils/theme_constants.dart';
import 'screens/score_page/page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kProjectName,
      theme: ThemeData(
        primaryColor: kVioletColor,
      ),
      initialRoute: PageQuestionQcmImageText.getPageName(),
      routes: {
        PageSignUp.getPageName(): (context) => PageSignUp(),
        PageLogIn.getPageName(): (context) => PageLogIn(),
        PageHome.getPageName(): (context) => PageHome(),
        PageMenu0.getPageName(): (context) => PageMenu0(),
        PageScore.getPageName(): (context) => PageScore(domain: DomainNames.calculs,stars: 2,),
        PageRoad.getPageName() : (context) => PageRoad(domain: DomainNames.geometry,),
        PageQuestionQcmTextText.getPageName(): (context) => PageQuestionQcmTextText(domain : DomainNames.evaluation),
        PageQuestionQcmImageText.getPageName(): (context) => PageQuestionQcmImageText(domain : DomainNames.geometry),
        PageQuestionQcmTextImage.getPageName(): (context) => PageQuestionQcmTextImage(domain : DomainNames.geometry),
      },
    );
  }
}

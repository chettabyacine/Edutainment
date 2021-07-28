import 'package:edutainment/screens/calculs_game/page.dart';
import 'package:edutainment/screens/congratulation/page.dart';
import 'package:edutainment/screens/geometry_animals_game/page.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:edutainment/screens/evaluation_game/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: PageEvaluationGame.getPageName(),
      routes: {
        PageSignUp.getPageName(): (context) => PageSignUp(),
        PageLogIn.getPageName(): (context) => PageLogIn(),
        PageHome.getPageName(): (context) => PageHome(),
        PageEntryPoint.getPageName(): (context) => PageEntryPoint(),
        PageScore.getPageName(): (context) => PageScore(),
        PageCalculsGame.getPageName(): (context) => PageCalculsGame(),
        PageSettings.getPageName(): (context) => PageSettings(),
        PageRoad.getPageName(): (context) => PageRoad(),
        PageLevelAnimalsOrGeometry.getPageName(): (context) =>
            PageLevelAnimalsOrGeometry(),
        PageCongratulation.getPageName(): (context) => PageCongratulation(),
        PageEvaluationGame.getPageName(): (context) => PageEvaluationGame(),
      },
    );
  }
}

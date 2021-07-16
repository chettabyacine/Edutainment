import 'dart:math';

import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/screens/statistics/page.dart';
import 'package:edutainment/services/QuestionAnimalsDBModel.dart';
import 'package:edutainment/services/defaultData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/theme_constants.dart';
import '../../utils/constants.dart';
import 'local_widgets/WidgetHomeButton.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:edutainment/screens/settings/page.dart';
import 'package:edutainment/screens/global_rank/page.dart';
import 'package:edutainment/screens/geometry_animals_game/level1/LevelBrain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edutainment/services/user_db.dart';

class PageHome extends StatefulWidget {
  static const String _pageName = kPageNameHome;

  static String getPageName() {
    return _pageName;
  }

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedIndex = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  String userName = "";
  int userScore = 85;
  List<QueryDocumentSnapshot> userDocs;

  void _onItemTapped(int index) {
    setState(() async {
      userName = await UserDB(uid: user.uid).getUserName();
      print("user name in home page : ${userName}");
      userScore = await UserDB(uid: user.uid).getUserScore();
      userDocs = await UserDB(uid: user.uid).getUsers();
      userDocs.sort((a, b) => a.data()['score'].compareTo(b.data()['score']));
      _selectedIndex = index;
      switch (index) {
        case 0:
          break;
        case 1:
          //Rank page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageGlobalRank(
                    userDocs: userDocs.reversed.toList(),
                    userName: userName,
                    userScore: userScore)),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageStatistics(
                      currentScore: userScore,
                    )),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PageSettings(email: user.email, nom: userName, user: user),
            ),
          );
          break;
        default:
          break;
      }
    });
  }

//declaration of the three geometry levels
  LevelBrain lg1 = LevelBrain(numberOfStars: 0, currentScore: 0);
  LevelBrain lg2 = LevelBrain(numberOfStars: 0, currentScore: 0);
  LevelBrain lg3 = LevelBrain(numberOfStars: 0, currentScore: 0);
//decalaration of the three calcules levels
  LevelCalculs l1 = LevelCalculs(
    domainIndex: 1,
    numberOfStars: 0,
    duration: 15000,
    indexOfDataBase: 5,
    currentQuestion: 0,
    waitingQuestions: [],
    highestScore: 3,
    currentScore: 0,
    timeLeft: 30,
    userId: 0,
    color: kBlueColor,
    id: 1,
  );
  LevelCalculs l2 = LevelCalculs(
      domainIndex: 1,
      numberOfStars: 0,
      duration: 15000,
      indexOfDataBase: 5,
      currentQuestion: 0,
      waitingQuestions: [],
      highestScore: 3,
      currentScore: 0,
      timeLeft: 30,
      userId: 0,
      color: kBlueColor,
      id: 1);
  LevelCalculs l3 = LevelCalculs(
      domainIndex: 1,
      numberOfStars: 0,
      duration: 15000,
      indexOfDataBase: 5,
      currentQuestion: 0,
      waitingQuestions: [],
      highestScore: 3,
      currentScore: 0,
      timeLeft: 30,
      userId: 0,
      color: kBlueColor,
      id: 1);
  //declaration of the three animals levels
  LevelBrain la1 = LevelBrain(numberOfStars: 0, currentScore: 0);
  LevelBrain la2 = LevelBrain(numberOfStars: 0, currentScore: 0);
  LevelBrain la3 = LevelBrain(numberOfStars: 0, currentScore: 0);

  @override
  void initState() {
    super.initState();
    lg1.fillQuestionBank(level: 1, isGeometry: true);
    lg2.fillQuestionBank(level: 2, isGeometry: true);
    lg3.fillQuestionBank(level: 3, isGeometry: true);
    l1.fillQuestionBank(1);
    l2.fillQuestionBank(2);
    l3.fillQuestionBank(3);

    /*la1.fillQuestionBank(level: 1, isGeometry: false);
    la2.fillQuestionBank(level: 2, isGeometry: false);
    la3.fillQuestionBank(level: 3, isGeometry: false);*/

    for (QuestionAnimalsDBModel questionAnimals in defaultAnimals) {
      switch (questionAnimals.level) {
        case 1:
          la1.questionBank.add(questionAnimals.convertToRealQuestion());
          break;
        case 2:
          la2.questionBank.add(questionAnimals.convertToRealQuestion());
          break;
        case 3:
          la3.questionBank.add(questionAnimals.convertToRealQuestion());
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Domain domainCalculs = Domain(
        name: DomainNames.calculs,
        colour: kBlueColor,
        currentLevel: 0,
        levels: [this.l1, this.l2, this.l3]);
    Domain domainGeometry = Domain(
      name: DomainNames.geometry,
      colour: kGreenColor,
      currentLevel: 0,
      levels: [this.lg1, this.lg2, this.lg3],
    );
    Domain domainAnimaux = Domain(
      name: DomainNames.animals,
      colour: kYellowColor,
      currentLevel: 0,
      levels: [this.la1, this.la2, this.la3],
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            WidgetAppBarDomain(
              title: 'Edutainment',
              height: 140,
              isHome: true,
              domain: 0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeButton(
                        text: 'Calculs',
                        colour: kBlueColor,
                        icon: SvgPicture.asset(
                          'assets/icon calculs.svg',
                        ),
                        domain: domainCalculs,
                      ),
                      SizedBox(width: 10.0),
                      HomeButton(
                        text: 'Géométrie',
                        colour: kGreenColor,
                        icon: SvgPicture.asset(
                          'assets/icon geometry.svg',
                        ),
                        domain: domainGeometry,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeButton(
                        text: 'Animaux',
                        colour: kYellowColor,
                        icon: SvgPicture.asset(
                          'assets/icon animaux.svg',
                        ),
                        domain: domainAnimaux,
                      ),
                      SizedBox(width: 10.0),
                      HomeButton(
                        text: 'Evaluation',
                        colour: kRedColor,
                        icon: SvgPicture.asset(
                          'assets/icon evaluation.svg',
                        ),
                        domain: domainCalculs, //todo: change the args
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
              backgroundColor: kVioletColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon rank.svg'),
              label: 'Rang',
              backgroundColor: kVioletColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon stats.svg'),
              label: 'Statistiques',
              backgroundColor: kVioletColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
              backgroundColor: kVioletColor,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

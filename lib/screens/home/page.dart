import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/Domain.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/classes/QuestionCalculs.dart';
import 'package:edutainment/models/classes/QuestionInput.dart';
import 'package:edutainment/models/classes/QuestionQCM.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxImage.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/WidgetAppBar.dart';
import '../../utils/theme_constants.dart';
import '../../utils/constants.dart';
import 'local_widgets/WidgetHomeButton.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:edutainment/screens/settings/page.dart';
import 'package:edutainment/screens/global_rank/page.dart';
import 'package:edutainment/screens/geometry_animals_game/level1/LevelBrain.dart';
import 'package:edutainment/models/DB/QuestionDB.dart';

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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          break;
        case 1:
          //Rank page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageGlobalRank()),
          );
          break;
        case 2:
          //TODO: Go to statistics page
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageSettings(email: 'ji_hamouda@esi.dz', nom: 'Hamouda', prenom: 'Ilyes', profile: kBlueColor,),
            ),
          );
          break;
        default:
          break;
      }
    });
  }

//declaration of the three geometry levels
  LevelBrain lg1 = LevelBrain(numberOfStars: 0);
  LevelBrain lg2 = LevelBrain(numberOfStars: 0);
  LevelBrain lg3 = LevelBrain(numberOfStars: 0);
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
      id: 1,);
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

  @override
  void initState() {
    super.initState();

    //initialisation of the geometry levels
    lg1.fillQuestionBank(1);
    lg2.fillQuestionBank(2);
    lg3.fillQuestionBank(3);
    //initialisation of the calcules levels
    l1.fillQuestionBank(1);
    l2.fillQuestionBank(2);
    l3.fillQuestionBank(3);
  }

  @override
  Widget build(BuildContext context) {

    Domain domainCalculs = Domain(
        name: DomainNames.calculs,
        colour: kBlueColor,
        currentLevel: 0,
        levels: [this.l1, this.l2, this.l3]);

    /* **********************************************/
    // domain geometry

    Domain domainGeometry = Domain(
      name: DomainNames.geometry,
      colour: kGreenColor,
      currentLevel: 0,
      levels: [this.lg1, this.lg2, this.lg3],
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
                        domain: domainCalculs, //todo: change the args
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

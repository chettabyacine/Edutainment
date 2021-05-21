import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/WidgetAppBar.dart';
import '../../utils/theme_constants.dart';
import '../../utils/constants.dart';
import 'local_widgets/WidgetHomeButton.dart';
import 'package:edutainment/widgets/WidgetAppBarHome.dart';

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
          //TODO: Go to ranks page
          break;
        case 2:
          //TODO: Go to statistics page
          break;
        case 3:
          //TODO: Go to settings page
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBarHome(
              title: 'Edutainment',
              height: 140,
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
                      ),
                      SizedBox(width: 10.0),
                      HomeButton(
                        text: 'Géométrie',
                        colour: kGreenColor,
                        icon: SvgPicture.asset(
                          'assets/icon geometry.svg',
                        ),
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
                      ),
                      SizedBox(width: 10.0),
                      HomeButton(
                        text: 'Evaluation',
                        colour: kRedColor,
                        icon: SvgPicture.asset(
                          'assets/icon evaluation.svg',
                        ),
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

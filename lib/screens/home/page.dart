import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../sign_up/app_bar.dart';
import '../../utils/theme_constants.dart';
import '../../utils/constants.dart';

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
            AppBarWidget(
              title: kProjectName,
              logo: SvgPicture.asset(''),
              height: 120,
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
                        colour: Color(0xFF1490F5),
                        icon: SvgPicture.asset(
                          'assets/icon calculs.svg',
                        ),
                      ),
                      HomeButton(
                        text: 'Géométrie',
                        colour: Color(0xFF2CBAA4),
                        icon: SvgPicture.asset(
                          'assets/icon geometry.svg',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeButton(
                        text: 'Animeaux',
                        colour: Color(0xFFEDAE1D),
                        icon: SvgPicture.asset(
                          'assets/icon_animaux.svg',
                        ),
                      ),
                      HomeButton(
                        text: 'Evaluation',
                        colour: Color(0xFFFF6868),
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
              backgroundColor: kBlueColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon rank.svg'),
              label: 'Rang',
              backgroundColor: kBlueColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon stats.svg'),
              label: 'Statistiques',
              backgroundColor: kBlueColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
              backgroundColor: kBlueColor,
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

class HomeButton extends StatelessWidget {
  final String text;
  final Color colour;
  final SvgPicture icon;
  HomeButton({this.text, this.colour, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 135,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 15.0),
          Text(
            text,
            style: kHomeButtonTextStyle,
          )
        ],
      ),
    );
  }
}

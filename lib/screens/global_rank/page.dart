import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/screens/home/page.dart';
import 'package:edutainment/screens/settings/page.dart';
import 'package:edutainment/screens/global_rank/local_widgets/WidgetUserScore.dart';

class PageGlobalRank extends StatefulWidget {
  PublicUser currentUser = PublicUser(score: 350, userName: 'ilyash', rank: 1, userID: 'IH');
  List<PublicUser> publicUsers = [ PublicUser(score: 350, userName: 'ilyash', rank: 1, userID: 'IH'), PublicUser(score: 200, userName: 'ijlao', rank: 2, userID: 'IG'), PublicUser(score: 150, userName: 'Yacine Chettab', userID: 'YC', rank: 3)];
  //TODO get publicUsers and currentUser from the database
  @override
  _PageGlobalRankState createState() => _PageGlobalRankState(publicUsers: publicUsers, currentUser: currentUser);
}

class _PageGlobalRankState extends State<PageGlobalRank> {
  List<PublicUser> publicUsers;
  PublicUser currentUser;
  _PageGlobalRankState({this.publicUsers,@required this.currentUser});
  List<Widget> userScores;
  @override
  void initState() {
    userScores = [
      SizedBox(height: 40),
    ];
    for (int i = 0; i< publicUsers.length; i++){
      userScores.add( WidgetUserScore(user: publicUsers[i]));
    }
    userScores.add(SizedBox(height: 490));
    super.initState();
  }

  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageHome()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageGlobalRank()),
          );
          break;
        case 2:
        //TODO: Go to settings page
          break;
        case 3:
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageSettings(email: 'jy_ghodbane@esi.dz',prenom: 'Islam',nom: 'Ghodbane',profile: Colors.red,)));
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kVioletColor,
      body: ListView(

        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios,color: Color(0xFFdbdbdb),size: 40.0,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageHome()),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Expanded(child: SizedBox(width: 5,),),
              Text(
                currentUser.score.toString() ?? '0',
                style: TextStyle(
                  fontSize: 48.0,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  color: kWhiteColor,
                ),
              ),
              Text(
                'points',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  color: kWhiteColor,
                ),
              ),
              Expanded(child: SizedBox(width: 5,),),
            ],
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
            ),
            child: Column(
              children: userScores ?? [SizedBox(height: 525)]
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey[500],
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Color(0xFF3347FF),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon rank.svg'),
            label: 'Rang',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon stats.svg'),
            label: 'Statistiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings ,color: Colors.grey[500],),
            label: 'Paramètres',
            activeIcon: Icon(Icons.settings , color: Color(0xFF3347FF),),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3347FF),
        onTap: _onItemTapped,
      ),
    );
  }
}

class PublicUser{
  int score;
  int rank;
  String userName;
  String userID;

  PublicUser({@required this.score, @required this.userName, @required this.userID, @required this.rank});
}

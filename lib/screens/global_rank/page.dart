import 'package:edutainment/screens/statistics/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/screens/home/page.dart';
import 'package:edutainment/screens/settings/page.dart';
import 'package:edutainment/screens/global_rank/local_widgets/WidgetUserScore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edutainment/services/user_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageGlobalRank extends StatefulWidget {
  var userDocs;
  int userScore;
  String userName;

  PageGlobalRank({this.userDocs, this.userScore, this.userName}) {
    print(userScore);
    print(userName);
  }

  @override
  _PageGlobalRankState createState() => _PageGlobalRankState(
      userDocs: userDocs, scoreHolder: userScore, nameHolder: userName);
}

class _PageGlobalRankState extends State<PageGlobalRank> {
  //User user = FirebaseAuth.instance.currentUser;

  List<PublicUser> publicUsers = [];
  List<Widget> userScores = [];
  UserDB userDB = UserDB(uid: FirebaseAuth.instance.currentUser.uid);
  String nameHolder = '', idHolder = '';
  int scoreHolder, rankHolder = 0;
  List<QueryDocumentSnapshot> userDocs = [];

  _PageGlobalRankState({this.userDocs, this.scoreHolder, this.nameHolder});
  PublicUser currentUser;
  initState() {
    super.initState();
    currentUser = PublicUser(
        score: scoreHolder, userName: nameHolder, userID: nameHolder, rank: 0);
    for (var doc in userDocs) {
      rankHolder++;
      nameHolder = doc.data()['nom'];
      scoreHolder = doc.data()['score'];
      idHolder = nameHolder[0] ?? 0;
      if ((nameHolder == currentUser.userName) &&
          (scoreHolder == currentUser.score)) {
        nameHolder = 'moi';
      }
      publicUsers.add(PublicUser(
          score: scoreHolder,
          userName: nameHolder,
          userID: idHolder,
          rank: rankHolder));
    }
    userScores = [SizedBox(height: 40)];
    for (int i = 0; i < publicUsers.length; i++) {
      userScores.add(WidgetUserScore(user: publicUsers[i]));
    }
    userScores.add(SizedBox(height: 490));
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
          break;
        case 2:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageStatistics(
                        currentScore: currentUser.score,
                      )));
          break;
        case 3:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageSettings(
                        email: FirebaseAuth.instance.currentUser.email,
                        nom: currentUser.userName,
                        user: FirebaseAuth.instance.currentUser,
                      )));
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
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFdbdbdb),
                size: 40.0,
              ),
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
              Expanded(
                child: SizedBox(
                  width: 5,
                ),
              ),
              Text(
                currentUser?.score?.toString() ?? '0',
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
              Expanded(
                child: SizedBox(
                  width: 5,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
            ),
            child: Column(children: userScores ?? [SizedBox(height: 525)]),
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
            icon: Icon(
              Icons.settings,
              color: Colors.grey[500],
            ),
            label: 'Paramètres',
            activeIcon: Icon(
              Icons.settings,
              color: Color(0xFF3347FF),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3347FF),
        onTap: _onItemTapped,
      ),
    );
  }
}

class PublicUser {
  int score;
  int rank;
  String userName;
  String userID;

  PublicUser(
      {@required this.score,
      @required this.userName,
      @required this.userID,
      @required this.rank});
}

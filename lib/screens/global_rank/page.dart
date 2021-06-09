import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class PageGlobalRank extends StatefulWidget {
  PublicUser currentUser =
      PublicUser(score: 350, userName: 'ilyash', rank: 1, userID: 'IH');
  List<PublicUser> publicUsers = [
    PublicUser(score: 350, userName: 'ilyash', rank: 1, userID: 'IH'),
    PublicUser(score: 200, userName: 'ijlao', rank: 2, userID: 'IG'),
    PublicUser(score: 150, userName: 'Yacine Chettab', userID: 'YC', rank: 3)
  ];
  //TODO get publicUsers and currentUser from the database
  @override
  _PageGlobalRankState createState() =>
      _PageGlobalRankState(publicUsers: publicUsers, currentUser: currentUser);
}

class _PageGlobalRankState extends State<PageGlobalRank> {
  List<PublicUser> publicUsers;
  PublicUser currentUser;
  _PageGlobalRankState({this.publicUsers, @required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kVioletColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currentUser.score.toString(),
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
            ],
          ),
          SizedBox(height: 50),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 40),
                WidgetUserScore(user: publicUsers[0]),
                SizedBox(height: 5),
                WidgetUserScore(user: publicUsers[1]),
                SizedBox(height: 5),
                WidgetUserScore(user: publicUsers[2]),
              ],
            ),
          ),
        ],
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

class WidgetUserScore extends StatelessWidget {
  PublicUser user;

  WidgetUserScore({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          user.rank.toString() ?? '',
          style: TextStyle(
            color: Color(0xFF1B1B1C),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF5F6FB),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: kVioletColor,
                child: Text(
                  user.userID,
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                user.userName ?? '',
                style: TextStyle(
                  color: Color(0xFF1B1B1C),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(width: 40.0),
              Text(
                user.score.toString() ?? '',
                style: TextStyle(
                  color: Color(0xFF1B1B1C),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
      ],
    );
  }
}

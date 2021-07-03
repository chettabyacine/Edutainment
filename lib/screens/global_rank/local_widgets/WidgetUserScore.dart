import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:edutainment/screens/global_rank/page.dart';
import 'package:edutainment/utils/theme_constants.dart';

class WidgetUserScore extends StatelessWidget {
  PublicUser user;

  WidgetUserScore({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
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
              Expanded(
                child: Container(
                  width: 500.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6FB),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundColor: RandomColor().randomColor(colorSaturation: ColorSaturation.highSaturation),
                        child: Text(
                          user.userID ?? '',
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
                      Expanded(child: SizedBox(width: 40.0)),
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
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
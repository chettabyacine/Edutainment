import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/theme_constants.dart';

class AppBarHome extends StatelessWidget {
  final double height;
  final SvgPicture logo;
  final String title;

  AppBarHome({this.title, this.logo, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: height - 380,
            child: Container(
              child: SvgPicture.asset('assets/upper shape.svg'),
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Container(
                child: Text(
                  title,
                  style: kSignUpTitleTextStyle,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

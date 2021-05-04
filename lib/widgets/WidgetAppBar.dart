import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/theme_constants.dart';

class AppBarWidget extends StatelessWidget {
  final double height;
  final SvgPicture logo;
  final String title;

  AppBarWidget({this.title, this.logo, this.height});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo,
                    Container(
                      child: Text(
                        title,
                        style: kSignUpTitleTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

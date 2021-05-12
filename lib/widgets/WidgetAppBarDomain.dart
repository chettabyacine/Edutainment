import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/theme_constants.dart';

class WidgetAppBarDomain extends StatelessWidget {
  final double height;
  final String title;
  final int domain;
  WidgetAppBarDomain({this.domain, this.height, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBarDomain(
      domain: domain,
      title: title,
      height: height,
    );
  }
}

// ignore: non_constant_identifier_names
StatelessWidget AppBarDomain(
    {final double height, final String title, final int domain}) {
  return Container(
    height: height,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: height - 380,
          child: Container(
            child: SvgPicture.asset('assets/Upper shape $domain.svg'),
          ),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      title,
                      style: kSignUpTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

import 'package:edutainment/screens/home/page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(context, PageHome.getPageName());
            },
          text: 'Allons-y',
          style: TextStyle(
            fontFamily: 'Acme',
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kVioletColor,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 2.0),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/gestures.dart';

class FooterText extends StatelessWidget {
  FooterText(
      {@required String this.text1,
      @required String this.text2,
      @required String this.destination});

  String text1, text2, destination;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text1,
        style: kSignUpLabelTextStyle,
        children: [
          TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, destination);
              },
            style: TextStyle(
              color: kVioletColor,
            ),
          ),
        ],
      ),
    );
  }
}

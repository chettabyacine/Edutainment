import 'package:edutainment/screens/password_forgot/page.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/gestures.dart';

class FooterPasswordForgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Mot de passe oublié?',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, PagePasswordForgot.getPageName());
              },
            style: kSignUpLabelTextStyle.copyWith(
              color: kVioletColor,
            ),
          ),
        ],
      ),
    );
  }
}

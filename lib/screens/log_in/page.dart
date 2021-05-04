import 'package:edutainment/screens/home/page.dart';
import 'package:edutainment/screens/sign_up/page.dart';
import 'package:edutainment/widgets/WidgetActionButton.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/theme_constants.dart';
import '../sign_up/local_widgets/WidgetAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'local_widgets/EmailInput.dart';
import '../../widgets/WidgetFooterPasswordForgot.dart';
import '../../widgets/WidgetFooterText.dart';

import 'local_widgets/PasswordInput.dart';

class PageLogIn extends StatefulWidget {
  static const String _pageName = kPageNameLogIn;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageLogInState createState() => _PageLogInState();
}

class _PageLogInState extends State<PageLogIn> {
  TextStyle style = kSignUpLabelTextStyle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBarWidget(
              height: 250.0,
              logo: SvgPicture.asset('assets/bird.svg'),
              title: kProjectName,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Padding(
                    child: EmailInput(),
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    child: PasswordInput(),
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: WidgetActionButton(
                      text: 'S\'identifier',
                      destination: PageHome.getPageName(),
                      isFilled: true,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  FooterText(
                      text1: 'Vous n\'avez pas un compte? ',
                      text2: 'S\'inscrire',
                      destination: PageSignUp.getPageName()),
                  FooterPasswordForgot(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

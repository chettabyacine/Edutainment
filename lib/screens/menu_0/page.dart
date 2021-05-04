import 'package:edutainment/screens/log_in/page.dart';
import 'file:///D:/Mobile/Flutter/edutainment/lib/widgets/WidgetAppBar.dart';
import 'package:edutainment/screens/sign_up/page.dart';
import 'package:edutainment/widgets/WidgetActionButton.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageMenu0 extends StatelessWidget {
  static const String _pageName = kPageNameMenu0;

  static String getPageName() {
    return _pageName;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarWidget(
                  height: 170.0,
                  logo: SvgPicture.asset('assets/bird.svg'),
                  title: kProjectName,
                ),
                Column(
                  children: [
                    WidgetActionButton(
                      text: 'S\'inscrire',
                      destination: PageSignUp.getPageName(),
                      isFilled: true,
                    ),
                    WidgetActionButton(
                      text: 'S\'identifier',
                      destination: PageLogIn.getPageName(),
                      isFilled: false,
                    ),
                  ],
                ),
                Container(
                  height: 0.0,
                ),
              ],
            ),
          )),
    );
  }
}

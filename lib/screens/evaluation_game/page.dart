import 'dart:math';

import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import 'Widgets.dart';

class PageEvaluationGame extends StatefulWidget {
  static const String _pageName = kPageEvaluationGame;

  static String getPageName() {
    return _pageName;
  }
  @override
  _PageEvaluationGameState createState() => _PageEvaluationGameState();
}

class _PageEvaluationGameState extends State<PageEvaluationGame> {

  Widget chooseBody(int domain){
    return (domain == 1) ? CalculsBody() : GeometryOrAnimalsBody();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              WidgetAppBarDomain(
                title: "Evaluation", // to change
                isHome: false,
                domain: 4,
                height: 140,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                          Icons.thumb_up_rounded,
                          color: Colors.red,
                      ),
                      Text(
                        ' :0',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold,
                          color: kRedColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_down_rounded,
                        color: Colors.red
                      ),
                      Text(
                        ' :0',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold,
                          color: kRedColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
             chooseBody(Random().nextInt(2)+1),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/bird.svg'),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

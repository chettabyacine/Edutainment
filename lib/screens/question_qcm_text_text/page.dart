import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageQuestionQcmTextText extends StatefulWidget {
  static const String _pageName = kPageQuestionQcmTextText;

  @override
  _PageQuestionQcmTextTextState createState() =>
      _PageQuestionQcmTextTextState();
  static String getPageName() {
    return _pageName;
  }
}

class _PageQuestionQcmTextTextState extends State<PageQuestionQcmTextText> {
  @override
  Widget build(BuildContext context) {
    final DomainNames domain = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background ${domainIndex[domain]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              WidgetAppBarDomain(
                title: domainString[domain], // to change
                domain: domainIndex[domain],
                height: 140,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Score:8',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      color: domainColor[domain],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //width: 284,
                    //height: 71,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Text(
                      "Qui est le joueur ayant le plus grand nombre de balons d'or",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Ronaldo',
                      style: TextStyle(
                        color: domainColor[domain],
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(130, 45)),
                        elevation: MaterialStateProperty.all<double>(6),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Zizou',
                      style: TextStyle(
                        color: domainColor[domain],
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(130, 45)),
                        elevation: MaterialStateProperty.all<double>(6),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Messi',
                      style: TextStyle(
                        color: domainColor[domain],
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(130, 45)),
                        elevation: MaterialStateProperty.all<double>(6),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Gwardiola',
                      style: TextStyle(
                        color: domainColor[domain],
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(130, 45)),
                        elevation: MaterialStateProperty.all<double>(6),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white)))),
                  ),
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 70),
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

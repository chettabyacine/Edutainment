import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/widgets/WidgetAppBarDomain.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageQuestionQcmImageText extends StatefulWidget {
  static const String _pageName = kPageQuestionQcmImageText;

  @override
  _PageQuestionQcmImageTextState createState() =>
      _PageQuestionQcmImageTextState();
  static String getPageName() {
    return _pageName;
  }
}

class _PageQuestionQcmImageTextState extends State<PageQuestionQcmImageText> {
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
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
                    "Ceci c'est un :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                child: SvgPicture.asset('assets/rectangle.svg'),
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
                      'Carré',
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
                      'Triangle',
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
                      'Circle',
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
                      'Rectangle',
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

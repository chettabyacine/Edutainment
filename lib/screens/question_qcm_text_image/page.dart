import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/models/DomainNames.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/widgets/WidgetAppBarDynamic.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageQuestionQcmTextImage extends StatefulWidget {
  static const String _pageName = kPageQuestionQcmTextImage;
  @required DomainNames domain;
  PageQuestionQcmTextImage({this.domain});


  @override
  _PageQuestionQcmTextImageState createState() =>
      _PageQuestionQcmTextImageState();
  static String getPageName() {
    return _pageName;
  }
}

class _PageQuestionQcmTextImageState extends State<PageQuestionQcmTextImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background ${domainIndex[widget.domain]}.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBarDynamicWidget(
                title: domainString[widget.domain], // to change
                domaine: domainIndex[widget.domain],
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
                      color: domainColor[widget.domain],
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
                height: 50,
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
                    "Où t-il le traingle ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/trapezoid.svg'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(130, 70)),
                        elevation: MaterialStateProperty.all<double>(6), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)
                        )
                      )
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/circle.svg'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(130, 70)),
                        elevation: MaterialStateProperty.all<double>(6), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)
                        )
                      )
                    ),
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
                    child: SvgPicture.asset('assets/triangle.svg'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(130, 70)),
                        elevation: MaterialStateProperty.all<double>(6), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)
                        )
                    )
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/star.svg'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize: MaterialStateProperty.all<Size>(Size(130, 70)),
                        elevation: MaterialStateProperty.all<double>(6), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white)
                        )
                     )
                    ),
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

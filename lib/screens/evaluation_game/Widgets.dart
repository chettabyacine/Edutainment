import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxImage.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';


//------------------------------------------------------
class CalculsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey, blurRadius: 3.0, offset: Offset(0.0, 1))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetNumber(number: '0'),
                WidgetAnswerButton(),
                WidgetNumber(number: '0'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget WidgetNumber({@required String number}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xffD0E5F7),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kBlueColor,
              width: 1.6,
              style: BorderStyle.solid,
            ),
          ),
          child: Text(
            number,
            style: TextStyle(
              color: kBlueColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget WidgetAnswerButton() {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetTextButton(userAnswer: AnswerCalculs.less, text: '<'),
          WidgetTextButton(userAnswer: AnswerCalculs.equals, text: '='),
          WidgetTextButton(userAnswer: AnswerCalculs.greater, text: '>'),
        ],
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Container WidgetTextButton(
    {@required AnswerCalculs userAnswer, @required String text}) {
  return Container(
    child: TextButton(
      onPressed: () {},
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        width: 1.6,
        style: BorderStyle.solid,
        color: kBlueColor,
      ),
    ),
  );
}
//-------------------------------------------------------

class GeometryOrAnimalsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        //todo : put qst
        WidgetQuestionBoxImage(
            image: SvgPicture.asset('assets/geometric shapes/2D shapes non filled/rectangle.svg')),
        SizedBox(
          height: 60,
        ),
        //todo: put answers
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child:Text(
                'choices[3]',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                  }),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                child:Text(
                  'choices[3]',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                }),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child:Text(
                  'choices[3]',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                }),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                child:Text(
                  'choices[3]',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                }),
          ],
        ),
      ],
    );
  }
}

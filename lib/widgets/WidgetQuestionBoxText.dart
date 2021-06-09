import 'package:flutter/material.dart';

class WidgetQuestionBoxText extends StatelessWidget {
  final String questionText;

  WidgetQuestionBoxText({@required this.questionText});
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            questionText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

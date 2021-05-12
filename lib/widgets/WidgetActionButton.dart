import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/gestures.dart';

class WidgetActionButton extends StatelessWidget {
  WidgetActionButton(
      {@required this.text,
      @required this.destination,
      @required this.isFilled});
  final String text, destination;
  final bool isFilled;

  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushNamed(context, destination);
            },
          text: text,
          style: isFilled
              ? kActionButtonTextStyleFilled
              : kActionButtonTextStyleEmpty,
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: text == 'S\'inscrire' ? 25.0 : 20.0, vertical: 10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isFilled ? kVioletColor : Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          color: kVioletColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 2.0),
          ),
        ],
      ),
    );
  }
} /*

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: kActionButtonTextStyle,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kVioletColor,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 2.0),
          ),
        ],
      ),
    );
  }
}
*/

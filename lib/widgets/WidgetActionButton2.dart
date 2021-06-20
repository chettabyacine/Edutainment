import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/gestures.dart';

class WidgetActionButton2 extends StatelessWidget {
  WidgetActionButton2(
      {@required this.text,
      @required this.isFilled,
      this.onPressed});
  final String text;
  final bool isFilled;
  final Function onPressed;

  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = onPressed,
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

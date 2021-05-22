import 'package:flutter/material.dart';

class WidgetChoiceTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function onPressed;

  WidgetChoiceTextButton({@required this.text, @required this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          minimumSize: MaterialStateProperty.all<Size>(Size(130, 45)),
          elevation: MaterialStateProperty.all<double>(6),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white)
              )
          )
      ),
    );
  }
}
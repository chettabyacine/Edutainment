import 'package:flutter/material.dart';

class WidgetChoiceImageButton extends StatelessWidget {
  final Widget image;
  final Function onPressed;

  WidgetChoiceImageButton({@required this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: image,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          minimumSize: MaterialStateProperty.all<Size>(Size(130, 70)),
          elevation: MaterialStateProperty.all<double>(6),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white)))),
    );
  }
}

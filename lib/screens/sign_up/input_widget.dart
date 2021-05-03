import 'package:flutter/material.dart';
import '../../utils/theme_constants.dart';

class InputWidget extends StatelessWidget {
  String data, label;
  final IconData icon;
  InputWidget({this.data, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
      child: ListTile(
        trailing: Icon(
          icon,
          color: kBlueColor,
        ),
        title: TextField(
          textAlign: TextAlign.start,
          onChanged: (value) {
            data = value;
          },
          style: kSignUpTextFieldStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: label),
        ),
      ),
    );
  }
}

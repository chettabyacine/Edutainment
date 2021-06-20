import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class PasswordInput extends StatelessWidget {
  final Function onChanged;

  PasswordInput({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: true,
      style: kSignUpLabelTextStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(
          Icons.lock,
          color: kVioletColor,
        ),
        hintText: "Mot de passe",
        hintStyle: TextStyle(
          color: kVioletColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: kVioletColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class EmailInput extends StatelessWidget {
  final Function onChanged;

  EmailInput({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      style: kSignUpLabelTextStyle,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: kVioletColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Adresse email",
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

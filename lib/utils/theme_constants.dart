import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTitleWhiteColor = Color(0xFFF6F5F5);
const kBlueColor = Color(0xFF3347FF);

const kSignUpTitleTextStyle = TextStyle(
  fontFamily: 'Acme',
  color: kTitleWhiteColor,
  fontSize: 36.0,
  fontWeight: FontWeight.w400,
);
const kSignUpTextFieldStyle = TextStyle(
  color: Color(0xFF666666),
  fontFamily: 'Open Sans',
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
);
const kSignUpLabelTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  color: Color(0xFF000000),
  fontSize: 12.0,
);

const kHomeButtonTextStyle = TextStyle(
  fontFamily: 'Acme',
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: InputBorder.none,
);

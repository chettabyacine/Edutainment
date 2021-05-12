import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kWhiteColor = Color(0xFFF6F5F5);
const kVioletColor = Color(0xFF3347FF);
const kBlueColor = Color(0xFF1490F5);
const kGreenColor = Color(0xFF2CBAA4);
const kYellowColor = Color(0xFFEDAE1D);
const kRedColor = Color(0xFFFF6868);

const double kHeightAppBar = 135;

const kFontWeight1 = FontWeight.w500;

const kSignUpTitleTextStyle = TextStyle(
  fontFamily: 'Acme',
  color: kWhiteColor,
  fontSize: 36.0,
  fontWeight: kFontWeight1,
);

const kSignUpTextFieldStyle = TextStyle(
  color: Color(0xFF666666),
  fontFamily: 'Open Sans',
  fontWeight: kFontWeight1,
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
  fontWeight: kFontWeight1,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: InputBorder.none,
);

const kActionButtonTextStyleFilled = TextStyle(
  fontFamily: 'Acme',
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: kFontWeight1,
  letterSpacing: 1,
);

const kActionButtonTextStyleEmpty = TextStyle(
  fontFamily: 'Acme',
  fontSize: 20.0,
  color: kVioletColor,
  fontWeight: kFontWeight1,
  letterSpacing: 1,
);

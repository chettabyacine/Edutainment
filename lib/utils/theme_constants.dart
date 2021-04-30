import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTitleWhiteColor = Color(0xDDF6F5F5);
const kBlueColor = Color(0xFF3347FF);

const kTitleTextStyle = TextStyle(
  fontFamily: 'Acme',
  color: kTitleWhiteColor,
  fontSize: 36.0,
  fontWeight: FontWeight.w400,
);
const kTextFieldStyle = TextStyle(
  fontFamily: 'Open Sans',
  fontWeight: FontWeight.w400,
  fontSize: 13.0,
);
const kLabelTextStyle = TextStyle(
  fontFamily: 'Open Sans',
  color: Color(0xFF000000),
  fontSize: 11.0,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: InputBorder.none,
);

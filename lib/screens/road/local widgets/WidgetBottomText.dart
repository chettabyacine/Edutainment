import 'package:edutainment/models/classes/DomainNames.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String text;
  final DomainNames domain;
  BottomText({this.domain, this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: domainColor[domain],
        //fontWeight: FontWeight.w900,
      ),
    );
  }
}

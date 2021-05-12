import 'package:edutainment/models/DomainNames.dart';
import 'package:flutter/material.dart';
class BottomText extends StatelessWidget {
  final DomainNames domain;
  BottomText({this.domain});
  @override
  Widget build(BuildContext context) {
    return Text(
      'vous etes là!',
      style: TextStyle(
        fontSize: 11,
        color: domainColor[domain],
        //fontWeight: FontWeight.w900,
      ),
    );
  }
}

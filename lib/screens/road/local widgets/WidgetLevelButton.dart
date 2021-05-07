import 'package:flutter/material.dart';
import 'package:edutainment/models/DomainNames.dart';
class LevelButton extends StatelessWidget {
  final int levelNumber;
  final bool isOnTheRight;
  final Widget bottom;
  final DomainNames domain;

  LevelButton({this.levelNumber,this.isOnTheRight,this.bottom,this.domain});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isOnTheRight? CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            //TODO: NAVIGATE TO LEVEL
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: domainColor[domain],
          ),
          child: Text('${levelNumber}'),
        ),
        this.bottom,
      ],
    );
  }
}


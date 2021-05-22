import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/widgets/WidgetChoiceImageButton.dart';

class WidgetQcmChoices extends StatelessWidget {
  final List<Widget> choiceList;
  WidgetQcmChoices({@required this.choiceList});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            choiceList[0],
            SizedBox(
              width: 15,
            ),
            choiceList[1],
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            choiceList[2],
            SizedBox(
              width: 15,
            ),
            choiceList[3],
          ],
        ),
      ],
    );
  }
}

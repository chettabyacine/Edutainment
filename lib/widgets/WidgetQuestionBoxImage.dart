import 'package:flutter/material.dart';

class WidgetQuestionBoxImage extends StatelessWidget {
  final Widget image;

  WidgetQuestionBoxImage({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: image,
    );
  }
}

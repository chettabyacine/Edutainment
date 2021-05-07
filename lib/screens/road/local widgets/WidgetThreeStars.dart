import 'package:flutter/material.dart';

class ThreeStars extends StatelessWidget {
  final int numberOfColored;
  final bool isOnTheRight;
  ThreeStars({this.numberOfColored,this.isOnTheRight});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isOnTheRight? MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          size:20,
          color: (numberOfColored >=1)? Color(0xffDBFF00) : Colors.grey,
        ),
        Icon(
          Icons.star,
          size:20,
          color: (numberOfColored >=2)? Color(0xffDBFF00) : Colors.grey,
        ),
        Icon(
          Icons.star,
          size:20,
          color: (numberOfColored >=3)? Color(0xffDBFF00) : Colors.grey,
        ),
      ],
    );
  }
}
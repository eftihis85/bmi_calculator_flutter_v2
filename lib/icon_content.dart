import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCardContentGender extends StatelessWidget {
  ReusableCardContentGender({required this.textMain, required this.iconMain});

  final String textMain;
  final IconData iconMain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconMain,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(textMain, style: kLabelTextStyle)
      ],
    );
  }
}

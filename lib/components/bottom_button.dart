import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_v2/screens/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(@required this.text, @required this.onTap);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(child: Text(this.text, style: kLargeButtonStyle)),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity, // <<----------------
        height: kBottomContainerHight,
      ),
    );
  }
}

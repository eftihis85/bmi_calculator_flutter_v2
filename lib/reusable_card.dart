import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function() onPress; //represents a function with no parameter:
  // Function  represents a function with no parameter:

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Expanded(
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

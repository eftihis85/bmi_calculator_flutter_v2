import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_v2/screens/constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Results',
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Normal',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '18.3',
                      style: kBMITextStyle,
                    ),
                    Text(
                      'Your BMI result is ...',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButton('RE-CALCULATE', () {
                      Navigator.pop(context);
                    })
                  ],
                ),
                onPress: () {},
              ))
        ],
      ),
    );
  }
}

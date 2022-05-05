import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:bmi_calculator_flutter_v2/screens/constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'package:bmi_calculator_flutter_v2/screens/calculator_brain.dart';

enum Gender { notSet, male, female }
Gender selectedGender = Gender.notSet;

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            /**
             * First Row
             */
            child: Row(
              children: [
                /**
                 * First box
                 */
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableCardContentGender(
                        textMain: 'MALE', iconMain: FontAwesomeIcons.mars),
                  ),
                ),
                /**
                 * Second box
                 */
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableCardContentGender(
                        textMain: 'FEMALE', iconMain: FontAwesomeIcons.venus),
                  ),
                )
              ],
            ),
          ),
          /**
           * Second row
           */
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGTH',
                    style: kLabelTextStyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x129B1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print(height.toString());
                      },
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /**
           * Third  row
           */
          Expanded(
            child: Row(
              children: [
                /**
                 * First box
                 */
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                /**
                 * Second box
                 */
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton('CALCULATE', () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult(),
                        )));
          })
        ],
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

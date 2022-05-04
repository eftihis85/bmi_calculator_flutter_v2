import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_v2/components/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.dark().copyWith(
            primary: Color(0xFF0A0E21),
            secondary: Colors.purple,
          ),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      // theme: ThemeData.dark()
      //     .copyWith(primaryColor: Colors.red,: Colors.purple),
      // ThemeData(
      //     // brightness: Brightness.dark,
      //     // colorScheme: ColorScheme.fromSwatch()
      //     //     .copyWith(primary: Colors.green, secondary: Colors.red),
      //     // primaryColor: Colors.amber,
      //     scaffoldBackgroundColor: Color(0xFF0A0E21),
      //     textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      //     colorScheme: ColorScheme.fromSwatch()
      //         .copyWith(primary: Color(0xFF0A0E21), secondary: Colors.purple)),
      home: InputPage(),
    );
  }
}

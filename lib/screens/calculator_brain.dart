import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  final double _bmi;

  CalculatorBrain({required this.height, required this.weight})
      : _bmi = weight / pow(height / 100, 2);

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    final String _res;

    if (_bmi >= 25) {
      _res = 'Overweight';
    } else if (_bmi > 18.5) {
      _res = 'Normal';
    } else {
      _res = 'Underweight';
    }

    return _res;
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Eat less!';
    } else if (_bmi > 18.5) {
      return 'Dont eat more';
    } else {
      return 'Eat more!';
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'dart:math';

class BMI {
  final int weight;
  final int height;
  final bool isMetric;
  double _value;
  String _result;
  String _interpretation;

  BMI({@required this.weight, @required this.height, @required this.isMetric}) {
    if (isMetric) {
      _value = weight.toDouble() / (pow((height / 100), 2)).toDouble();
    } else {
      _value = 703.0 * weight.toDouble() / (pow(height, 2)).toDouble();
    }

    if (_value >= 25) {
      _result = 'Overweight';
      _interpretation =
          'You have a higher than normal body weight. Try to exercise more.';
    } else if (_value > 18) {
      _result = 'Normal';
      _interpretation = 'You have a normal body weight. Good job!';
    } else {
      _result = 'Underweight';
      _interpretation =
          'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  double get value {
    return _value;
  }

  String get result {
    return _result;
  }

  String get interpretation {
    return _interpretation;
  }

  @override
  String toString() {
    return value.toStringAsFixed(1);
  }
}

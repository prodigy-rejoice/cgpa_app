import 'dart:math';
import 'package:collection/collection.dart';

class CalculatorBrain {
  late final int? qualityPoint;
  late final int? totalQualityPoint;
  final int creditUnit;
  final int numberGradePoint;
  late final double _gpa;

  CalculatorBrain({
    required this.numberGradePoint,
    this.totalQualityPoint,
    required this.creditUnit,
    this.qualityPoint,
  });

  String getInterpretation() {
    if (_gpa >= 4.50 && _gpa <= 5.00) {
      return 'First Class';
    } else if (_gpa >= 3.50 && _gpa <= 4.49) {
      return 'Second Class Upper';
    } else if (_gpa >= 2.40 && _gpa <= 3.49) {
      return 'Second Class Lower';
    } else if (_gpa >= 1.50 && _gpa <= 2.39) {
      return 'Third Class';
    } else if (_gpa >= 1.00 && _gpa <= 1.49) {
      return 'Pass';
    } else if (_gpa >= 0.00 && _gpa <= 0.99) {
      return 'Fail';
    } else {
      return 'Invalid details';
    }
  }

  String calculateGPA() {
    qualityPoint = creditUnit * numberGradePoint;
    // totalQualityPoint =
    return _gpa.toStringAsFixed(2);
  }
}

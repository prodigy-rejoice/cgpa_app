import 'package:flutter/material.dart';

class Gpa {
  late final Icon icon1;
  late final String courseName;
  late final String userCreditUnit;
  late final String userGradePoint;
  late final Icon icon2;

  Gpa(
      {required this.icon1,
      required this.userCreditUnit,
      required this.userGradePoint,
      required this.courseName,
      required this.icon2});
}

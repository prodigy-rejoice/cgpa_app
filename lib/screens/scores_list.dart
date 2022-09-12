import 'package:flutter/material.dart';
import '../utilities/score_tile.dart';
import '../models/gpa.dart';

class ScoresList extends StatelessWidget {
  final List<Gpa> scores = [];

  ScoresList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Courses: ${scores.length}'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: Expanded(
          child: ListView.builder(
            itemCount: scores.length,
            itemBuilder: (BuildContext context, int index) => ScoreTile(
                course: scores[index].courseName,
                userCreditUnit: scores[index].userCreditUnit,
                userGradePoint: scores[index].userGradePoint),
          ),
        ),
      ),
    );
  }
}

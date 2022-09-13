import 'package:cgpa_app/screens/gpa_result.dart';
import 'package:cgpa_app/utilities/gpa_calculator.dart';
import 'package:flutter/material.dart';
import '../utilities/score_tile.dart';
import '../models/gpa.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScoresList extends StatefulWidget {
  final List<Gpa> scores;

  const ScoresList({Key? key, required this.scores}) : super(key: key);

  @override
  State<ScoresList> createState() => _ScoresListState();
}

class _ScoresListState extends State<ScoresList> {
  @override
  Widget build(BuildContext context) {
    void clearList() {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "CLEAR ALL",
        desc: "Do you want to delete the list?",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: const Color.fromRGBO(0, 179, 134, 1.0),
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () {
              setState(() {
                widget.scores.clear();
                Navigator.pop(context);
              });
            },
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
            child: const Text(
              "CLEAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  widget.scores.clear();
                });
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 50.0,
            ),
            Text('Total Courses: ${widget.scores.length}'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.scores.length,
              itemBuilder: (BuildContext context, int index) {
                final score = widget.scores[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ScoreTile(
                      userNumberGrade: score.userNumberGrade,
                      course: score.courseName,
                      userCreditUnit: score.userCreditUnit,
                      userGradePoint: score.userGradePoint),
                );
              },
            ),
          ),
          Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      clearList();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 30.0),
                    child: Column(
                      children: const [
                        Icon(Icons.clear_all, color: Colors.white, size: 30.0),
                        Text(
                          'Clear All',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    CalculatorBrain calc = CalculatorBrain(
                        numberGradePoint: ScoreTile().userNumberGrade as int,
                        creditUnit: ScoreTile().userCreditUnit as int);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculateGpa(
                          interpretation: calc.getInterpretation(),
                          gpaResult: calc.calculateGPA(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 30.0),
                    child: Column(
                      children: const [
                        Icon(Icons.tablet, color: Colors.white, size: 30.0),
                        Text(
                          'Calculate',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

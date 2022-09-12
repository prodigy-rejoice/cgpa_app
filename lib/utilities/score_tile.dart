import 'package:flutter/material.dart';

class ScoreTile extends StatefulWidget {
  final String course;
  final String userCreditUnit;
  final String userGradePoint;
  const ScoreTile(
      {Key? key,
      required this.course,
      required this.userCreditUnit,
      required this.userGradePoint})
      : super(key: key);
  @override
  State<ScoreTile> createState() => _ScoreTileState();
}

class _ScoreTileState extends State<ScoreTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.edit,
              color: Colors.green,
            ),
          ),
          Text(
            widget.course,
            style: const TextStyle(fontSize: 17.0),
          ),
          Text(
            widget.userCreditUnit,
            style: const TextStyle(color: Colors.yellow, fontSize: 17.0),
          ),
          Text(
            widget.userGradePoint,
            style: const TextStyle(color: Colors.blueAccent, fontSize: 17.0),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.cancel,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

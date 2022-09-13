import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'creditunit_gp.dart';

class ScoreTile extends StatefulWidget {
  late String? course;
  late String? userCreditUnit;
  late String? userGradePoint;
  late String? userNumberGrade;
  ScoreTile(
      {Key? key,
      this.course,
      this.userCreditUnit,
      this.userGradePoint,
      this.userNumberGrade})
      : super(key: key);

  @override
  State<ScoreTile> createState() => _ScoreTileState();
}

class _ScoreTileState extends State<ScoreTile> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void editTile() {
    Alert(
        context: context,
        title: "Category edit form",
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                controller: controller1,
                decoration: InputDecoration(
                  hintText: widget.course,
                ),
                onChanged: (newValue) {
                  widget.course = newValue;
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                controller: controller2,
                decoration: InputDecoration(
                  hintText: widget.userCreditUnit,
                ),
                onChanged: (newValue) {
                  widget.userCreditUnit = newValue;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                controller: controller3,
                decoration: InputDecoration(
                  hintText: widget.userGradePoint,
                ),
                onChanged: (newValue) {
                  widget.userGradePoint = newValue;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                controller: controller4,
                decoration: InputDecoration(
                  hintText: widget.userNumberGrade,
                ),
                onChanged: (newValue) {
                  widget.userNumberGrade = newValue;
                },
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            color: Colors.red,
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            color: Colors.green,
            onPressed: () {
              setState(() {
                widget.course = controller1.text;
                widget.userCreditUnit = controller2.text;
                widget.userGradePoint = controller3.text;
                widget.userNumberGrade = controller4.text;
                Navigator.pop(context);
              });
            },
            child: const Text(
              "Update",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void deleteTile() {
    Alert(
      context: context,
      desc: "Are you sure you want to delete?",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.green,
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
          child: const Text(
            "Delete",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              editTile();
            });
          },
          child: const Icon(
            Icons.edit,
            color: Colors.green,
          ),
        ),
        Text(
          widget.course!,
          style: const TextStyle(fontSize: 17.0),
        ),
        Text(
          widget.userCreditUnit!,
          style: const TextStyle(color: Colors.yellow, fontSize: 17.0),
        ),
        Text(
          widget.userGradePoint!,
          style: const TextStyle(color: Colors.blueAccent, fontSize: 17.0),
        ),
        Text(
          widget.userNumberGrade!,
          style: const TextStyle(color: Colors.blueAccent, fontSize: 17.0),
        ),
        GestureDetector(
          onTap: () {
            deleteTile();
          },
          child: const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

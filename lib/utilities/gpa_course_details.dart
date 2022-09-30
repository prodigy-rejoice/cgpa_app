import 'package:flutter/material.dart';

import 'creditunit_gp.dart';

class CgpaCourseDetails extends StatefulWidget {
  final String headline;
  final Function(String?) onChangedCreditUnit;
  final Function(String?) onChangedGradePoint;
  final Function() removeCourse;
  const CgpaCourseDetails(
      {Key? key,
      required this.headline,
      required this.onChangedCreditUnit,
      required this.onChangedGradePoint,
      required this.removeCourse})
      : super(key: key);

  @override
  State<CgpaCourseDetails> createState() => _CgpaCourseDetailsState();
}

class _CgpaCourseDetailsState extends State<CgpaCourseDetails> {
  String userCreditUnit = "Select Credit Unit";
  String userGradePoint = 'Select your grade';
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getCreditUnit() {
      List<DropdownMenuItem<String>> creditUnitItems = [];
      for (String creditUnit in creditUnits) {
        var newItem = DropdownMenuItem(
          value: creditUnit,
          child: Text(creditUnit),
        );

        creditUnitItems.add(newItem);
      }
      return creditUnitItems;
    }

    List<DropdownMenuItem<String>> getGradePoint() {
      List<DropdownMenuItem<String>> gradePointItems = [];
      for (String grade in gradePoints) {
        var newItem = DropdownMenuItem(
          value: grade,
          child: Text(grade),
        );

        gradePointItems.add(newItem);
      }
      return gradePointItems;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40.0, left: 40.0, bottom: 8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.removeCourse;
                },
                child: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              Text(
                widget.headline,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextFormField(
          onChanged: (newValue) {
            setState(() {});
          },
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            } else if (value.length < 2) {
              //TODO: Edit this line of code above!
              return 'Please input a valid G.P.A';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.white60,
                )),
            hintText: 'Course Name',
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        DropdownButtonFormField<String>(
            dropdownColor: Colors.green,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              } else if (value.length < 2) {
                //TODO: Edit this line of code above!
                return 'Please input a valid G.P.A';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              filled: true,
            ),
            hint: Text(userGradePoint),
            items: getCreditUnit(),
            onChanged: (value) {}),
        const SizedBox(
          height: 25.0,
        ),
        DropdownButtonFormField<String>(
            dropdownColor: Colors.green,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              } else if (value.length < 2) {
                //TODO: Edit this line of code above!
                return 'Please input a valid G.P.A';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              filled: true,
            ),
            hint: Text(userGradePoint),
            items: getGradePoint(),
            onChanged: (value) {}),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CgpaSemesterDetails extends StatelessWidget {
  final String headline;
  // final String creditUnit1;
  // final String creditUnit2;
  // final String gpa1;
  // final String gpa2;
  const CgpaSemesterDetails({
    Key? key,
    required this.headline,

    // required this.creditUnit1,
    // required this.creditUnit2,
    // required this.gpa1,
    // required this.gpa2})
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40.0, left: 40.0, bottom: 8.0),
          child: Text(
            headline,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
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
            hintText: 'Total Credit Unit',
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            } else if (value.length < 2) {
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
            hintText: 'Semester\'s G.P.A',
          ),
        ),
      ],
    );
  }
}

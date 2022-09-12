import 'package:cgpa_app/screens/scores_list.dart';
import 'package:cgpa_app/utilities/creditunit_gp.dart';
import 'package:cgpa_app/utilities/rounded_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InputGpa extends StatefulWidget {
  const InputGpa({Key? key}) : super(key: key);

  @override
  State<InputGpa> createState() => _InputGpaState();
}

class _InputGpaState extends State<InputGpa> {
  String selectedCreditUnit = 'Select Course Unit';
  String selectedGradePoint = 'Select Grade';
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  int _counter = 0;

  void updateCounter() {
    setState(() {
      _counter++;
    });
  }

  List<DropdownMenuItem<String>> getCourseUnit() {
    List<DropdownMenuItem<String>> dropDown = [];
    for (String creditUnit in creditUnits) {
      var newItem = DropdownMenuItem(
        value: creditUnit,
        child: Text(creditUnit),
      );
      dropDown.add(newItem);
    }
    return dropDown;
  }

  List<DropdownMenuItem<String>> getGradePoint() {
    List<DropdownMenuItem<String>> dropDown = [];
    for (String gradePoint in gradePoints) {
      var newItem = DropdownMenuItem(
        value: gradePoint,
        child: Text(gradePoint),
      );
      dropDown.add(newItem);
    }
    return dropDown;
  }

  void zeroCounter() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "WARNING",
      desc: "Kindly fill in your details to proceed.",
      buttons: [
        DialogButton(
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "OKAY",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA CALCULATOR'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
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
              DropdownButton<String>(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  dropdownColor: Colors.green,
                  isExpanded: true,
                  hint: Text(selectedCreditUnit),
                  items: getCourseUnit(),
                  onChanged: (value) {
                    setState(() {
                      selectedCreditUnit = value!;
                    });
                  }),
              const SizedBox(
                height: 25.0,
              ),
              DropdownButton<String>(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  dropdownColor: Colors.green,
                  isExpanded: true,
                  hint: Text(selectedGradePoint),
                  items: getGradePoint(),
                  onChanged: (value) {
                    setState(() {
                      selectedGradePoint = value!;
                    });
                  }),
              const SizedBox(
                height: 25.0,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 40.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      updateCounter();
                    }
                  },
                  child: Text(
                    'Add',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RoundedIconButton(
                  gpaCounter: '$_counter',
                  onPress: () {
                    if (_counter != 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScoresList(),
                        ),
                      );
                    } else if (_counter == 0) {
                      return zeroCounter();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

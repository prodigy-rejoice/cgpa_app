import 'package:cgpa_app/screens/gpa_result.dart';
import 'package:cgpa_app/utilities/gpa_course_details.dart';
import 'package:flutter/material.dart';
import '../models/course.dart';

class InputDetailsForCourseGPA extends StatefulWidget {
  const InputDetailsForCourseGPA({Key? key}) : super(key: key);

  @override
  State<InputDetailsForCourseGPA> createState() =>
      _InputDetailsForCourseGPAState();
}

class _InputDetailsForCourseGPAState extends State<InputDetailsForCourseGPA> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  List<Course> myCourses = [
    Course(),
  ];

  void onChangedCreditUnit(value, index) {
    setState(() {
      myCourses[index].creditUnit = value;
    });
  }

  void onChangedGradePoint(value, index) {
    setState(() {
      myCourses[index].gradePoint = value;
    });
  }

  void addNewCourse() {
    setState(() {
      myCourses.add(Course());
    });
  }

  void resetAllCourses() {
    setState(() {
      myCourses = [Course()];
    });
  }

  void removeCourse() {
    setState(() {
      myCourses.remove(Course());
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime lastTimeBackButtonWasPressed = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastTimeBackButtonWasPressed) >=
            const Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              dismissDirection: DismissDirection.up,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              content: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Press the back button again to go back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              duration: Duration(seconds: 2),
            ),
          );
          lastTimeBackButtonWasPressed = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('G.P.A CALCULATOR'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: myCourses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CgpaCourseDetails(
                        headline: 'COURSE DETAILS',
                        onChangedCreditUnit: (value) =>
                            onChangedCreditUnit(value, index),
                        onChangedGradePoint: (value) =>
                            onChangedGradePoint(value, index),
                        removeCourse: () => removeCourse(),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                        ),
                        onPressed: () {
                          resetAllCourses();
                        },
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                        ),
                        onPressed: () {
                          addNewCourse();
                        },
                        child: const Text(
                          'Add Course',
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                ConstrainedBox(
                  //TODO: Position this box at the end of the screen with a little padding above!
                  constraints: const BoxConstraints.tightFor(height: 40.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepOrange)),
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const GpaResult();
                        }));
                      }
                    },
                    child: Text(
                      'Calculate',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

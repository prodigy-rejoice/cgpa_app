import 'package:cgpa_app/screens/input_cgpa_details_semester.dart';

import 'package:cgpa_app/screens/input_gpa_course_details.dart';
import 'package:cgpa_app/utilities/reusableCard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FFF9),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(70.0),
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '"SELECT',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(75, 89, 72, 1),
                    fontSize: 70.0,
                    fontWeight: FontWeight.w900),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'YOUR PREFERRED',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(75, 89, 72, 1),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'OPTION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(75, 89, 72, 1),
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const InputDetailsForCourseGPA(),
                          ),
                        );
                      });
                    },
                    color: const Color(0xffCEDCCE),
                    cardChild: const Text(
                      'G.P.A (Semester)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(75, 89, 72, 1),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const InputDetailsForSemesterCGPA();
                        }));
                      });
                    },
                    color: const Color(0xffCEDCCE),
                    cardChild: const Text(
                      'C.G.P.A (Final)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(75, 89, 72, 1),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const ReusableCard(
                    color: Color(0xffCEDCCE),
                    cardChild: Text(
                      'See History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(75, 89, 72, 1),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

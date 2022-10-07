import 'package:cgpa_app/screens/history_screen.dart';
import 'package:cgpa_app/screens/input_cgpa_details_semester.dart';
import 'package:cgpa_app/screens/input_gpa_course_details.dart';
import 'package:cgpa_app/utilities/reusableCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FFF9),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(70.0),
          padding: const EdgeInsets.only(left: 20.0),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 80.0),
                child: const Text(
                  "Hello User,",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Column(
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
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
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
                      HomeViewButton(
                        title: 'G.P.A (Semester)',
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
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      HomeViewButton(
                        title: 'C.G.P.A (Final)',
                        onPress: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InputDetailsForSemesterCGPA(),
                              ),
                            );
                          });
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      HomeViewButton(
                        title: 'See History',
                        onPress: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const History(),
                              ),
                            );
                          });
                        },
                      ),
                    ],
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

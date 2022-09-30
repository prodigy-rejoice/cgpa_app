import 'package:cgpa_app/screens/user_cgpa.dart';
import 'package:cgpa_app/utilities/calculate_cgpa.dart';
import 'package:flutter/material.dart';
import '../utilities/cgpa_semester_details.dart';

class InputDetailsForSemesterCGPA extends StatefulWidget {
  const InputDetailsForSemesterCGPA({Key? key}) : super(key: key);

  @override
  State<InputDetailsForSemesterCGPA> createState() =>
      _InputDetailsForSemesterCGPAState();
}

class _InputDetailsForSemesterCGPAState
    extends State<InputDetailsForSemesterCGPA> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

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
          title: const Text('C.G.P.A CALCULATOR'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CgpaSemesterDetails(headline: 'FIRST SEMESTER DETAILS'),
                const CgpaSemesterDetails(headline: 'SECOND SEMESTER DETAILS'),
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
                        // CalculateCgpa calc = CalculateCgpa(creditUnit1: creditUnit1, creditUnit2: creditUnit2, gpa1: gpa1, gpa2: gpa2)
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const UserCgpa();
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

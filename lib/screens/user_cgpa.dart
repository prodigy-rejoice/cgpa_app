import 'package:cgpa_app/utilities/reusableCard.dart';
import 'package:flutter/material.dart';

class UserCgpa extends StatelessWidget {
  const UserCgpa({Key? key, this.cgpaResult, this.interpretation})
      : super(key: key);
  final String? cgpaResult;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CGPA RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              color: Colors.green,
              cardChild: CircleAvatar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cgpaResult ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 90.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      interpretation ?? ''.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cgpa_app/screens/input_gpa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF090c22),
        ),
        scaffoldBackgroundColor: const Color(0xFF090c22),
      ),
      home: const InputGpa(),
    );
  }
}

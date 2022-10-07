import 'package:cgpa_app/screens/auth.dart';
import 'package:cgpa_app/screens/spash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CGPA Calculator",
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF090c22),
        ),
        scaffoldBackgroundColor: const Color(0xFF090c22),
      ),
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ostad_14_assignment_firebase_project/student_screen.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentScreen(),
    );
  }
}
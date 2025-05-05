import 'package:day3/Screans/addtasks.dart';
import 'package:day3/Screans/login.dart';
import 'package:day3/Screans/register.dart';
import 'package:day3/onbord.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // AddTasks(),
          OnBording(),
      //  Register(),
      // Login(),
    );
  }
}

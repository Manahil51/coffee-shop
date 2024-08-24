 import 'package:flutter/material.dart';
import 'package:project_1/UI/screens/onboarding.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SliderOnboarding(),
    );
  }
}


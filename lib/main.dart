import 'package:flutter/material.dart';

import 'inputsPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.purpleAccent.withOpacity(0.6),
        primaryColor: Colors.purple

      ),
      home: InputPage(),
    );
  }
}

// lfhglfdhgldfhg
// dlfhgldfg
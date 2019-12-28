import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/screens/input_page.dart';

void main() => runApp(BMICalculator());

const Color primaryColor = Color(0xFF090C22);

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(elevation: 12)
      ),
      home: InputPage(),
    );
     
  }
}



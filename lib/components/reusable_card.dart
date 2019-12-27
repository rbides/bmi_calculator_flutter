import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color; // can't be const
  final cardChild;
  final Function onSelectGender;

  ReusableCard({@required this.color, this.cardChild, this.onSelectGender});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectGender,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}

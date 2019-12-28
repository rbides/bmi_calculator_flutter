import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_buttom.dart';

class BottomReusableCard extends StatelessWidget {
  BottomReusableCard({this.dataText, @required this.data, @required this.dataDecrement, @required this.dataIncrement});

  final String dataText;
  final int data;
  final Function dataDecrement;
  final Function dataIncrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          dataText.toUpperCase(),
          style: kLabelTextStyle,
        ),
        Text(
          data.toString(),
          style: kNumbersStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: dataDecrement
              
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: dataIncrement
            )
          ],
        )
      ],
    );
  }
}
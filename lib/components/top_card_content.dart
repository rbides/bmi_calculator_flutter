import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';


class TopCardContent extends StatelessWidget {
  final String topCardText;
  final IconData topCardIcon;

  TopCardContent({this.topCardText, this.topCardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          topCardIcon,
          size: kIconSize,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          topCardText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

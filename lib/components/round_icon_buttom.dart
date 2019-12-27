import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed:
          onPressed, // if we don't have a onPressed, the button stays at a 'disabled' state in which it has no elevation
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
          //got from FAB
          width: 50.0,
          height: 50.0),
      shape: CircleBorder(),
      fillColor: kRoundIconButtonColor,
    );
  }
}

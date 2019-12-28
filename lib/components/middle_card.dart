import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class MiddleCard extends StatelessWidget {
  MiddleCard({@required this.height, @required this.setHeight});

  final int height;
  final Function setHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('HEIGHT', style: kLabelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.baseline, // match baseline of children
          textBaseline: TextBaseline
              .alphabetic, // has to be setted for the baseline alignment to work
          children: <Widget>[
            Text(
              '$height',
              style: kNumbersStyle,
            ),
            Text(
              'cm',
              style: kLabelTextStyle,
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              // this could be set in main.dart
              inactiveTickMarkColor: kUnselectedContentColor,
              activeTrackColor: Colors.white,
              thumbColor: kBottomContainerColor,
              overlayColor: Color(
                  0x29EB1555), // the 2 numbers after the 'x' is the transparency
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
          child: Slider(
            value: height.toDouble(),
            onChanged: setHeight,
            min: 100.0,
            max: 220.0,
          ),
        )
      ],
    );
  }
}

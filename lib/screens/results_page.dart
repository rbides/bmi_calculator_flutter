import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String resultBMI;
  final String resultText;
  final String interpretationText;

  ResultPage(
      {@required this.resultBMI,
      @required this.resultText,
      @required this.interpretationText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kNumbersStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kCardSelectedColor,
              cardChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText.toUpperCase(), style: kResultTextStyle),
                    Text(
                      resultBMI,
                      style: kNumbersStyle,
                    ),
                    Text(
                      interpretationText,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButtom(
            buttonTitle: 'RE-CALCULATE YOUR BMI',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

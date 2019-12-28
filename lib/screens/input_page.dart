import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:bmi_calculator_flutter/components/bottom_reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/constants.dart';

import 'package:bmi_calculator_flutter/screens/results_page.dart';

import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/components/top_card_content.dart';
import 'package:bmi_calculator_flutter/components/middle_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  //Color maleCardColor = cardUnselectedColor;
  //Color femaleCardColor = cardUnselectedColor;
  int height =
      180; // must be outside the build for the widget to use the new value on rebuild
  int weight = 60;
  int age = 18;

  Gender selectedGender;

  void selectMale() {
    setState(() {
      selectedGender = Gender.male;
    });
  }

  void selectFemale() {
    setState(() {
      selectedGender = Gender.female;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: selectedGender == Gender.male
                      ? kCardSelectedColor
                      : kCardUnselectedColor,
                  onSelectGender: selectMale,
                  cardChild: TopCardContent(
                    topCardIcon: FontAwesomeIcons.mars,
                    topCardText: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? kCardSelectedColor
                        : kCardUnselectedColor,
                    onSelectGender: selectFemale,
                    cardChild: TopCardContent(
                      topCardIcon: FontAwesomeIcons.venus,
                      topCardText: 'FEMALE',
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            color: kCardSelectedColor,
            cardChild: MiddleCard(
              height: height,
              setHeight: (double newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kCardSelectedColor,
                  cardChild: BottomReusableCard(
                    dataText: 'weight',
                    data: weight,
                    dataDecrement: () {
                      setState(() {
                        weight--;
                      });
                    },
                    dataIncrement: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                // creates age card
                child: ReusableCard(
                  color: kCardSelectedColor,
                  cardChild: BottomReusableCard(
                    dataText: 'age',
                    data: age,
                    dataDecrement: () {
                      setState(() {
                        age--;
                      });
                    },
                    dataIncrement: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButtom(
          buttonTitle: 'CALCULATE YOUR BMI',
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          resultBMI: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretationText: calc.getInterpretation(),
                        )));
          },
        )
      ]),
    );
  }
}


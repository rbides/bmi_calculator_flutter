import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/constants.dart';

import 'package:bmi_calculator_flutter/screens/results_page.dart';

import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/components/round_icon_buttom.dart';
import 'package:bmi_calculator_flutter/components/top_card_content.dart';



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
            cardChild: Column(
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
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 100.0,
                    max: 220.0,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kCardSelectedColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumbersStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kCardSelectedColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumbersStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButtom(
          buttonTitle: 'CALCULATE YOUR BMI',
          onTap: (){
            CalculatorBrain calc = CalculatorBrain(height, weight);

            

            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
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

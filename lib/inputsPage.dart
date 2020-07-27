import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmiCalculator.dart';
import 'customButton.dart';
import 'customCard.dart';
import 'genderWidget.dart';
import 'constant.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 170;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colored: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: GenderWidget(
                          icon: FontAwesomeIcons.male, label: "Male"),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colored: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: GenderWidget(
                          icon: FontAwesomeIcons.female, label: "Female"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                colored: kActiveCardColor,
                cardChild: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Height',
                        style: kLabelStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberLabelStyle,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'cm',
                            style: kLabelStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: kButtonColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 14.0),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: kSliderInActiveColor,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      colored: kActiveCardColor,
                      cardChild: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kLabelStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberLabelStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight != 0 ? weight-- : 0.toString();
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundedButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight < 200
                                          ? weight++
                                          : weight.toString();
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      colored: kActiveCardColor,
                      cardChild: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kLabelStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberLabelStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    // print("clicked");
                                    setState(() {
                                      age != 0 ? age-- : 0.toString();
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundedButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age < 120 ? age++ : age.toString();
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              label: 'CALCULATE',
              onPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        bmiResultText: calc.getResult(),
                        bmiResultSubTitle: calc.getInterpretation(),
                      ),
                ),
              );
            },
            )
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundedButton({Key key, this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(height: 50.0, width: 50.0),
      shape: CircleBorder(),
    );
  }
}

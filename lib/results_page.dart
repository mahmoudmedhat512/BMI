import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/customButton.dart';
import 'package:bmi_calculator/customCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;
  final String bmiResultSubTitle;

  const ResultsPage(
      {@required this.bmiResult, @required this.bmiResultText, @required this.bmiResultSubTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "YOUR RESULT",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              colored: kActiveCardColor.withOpacity(0.72),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultText,
                    style: kBMIReslutTitle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIResulte,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI range:',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0x60ffffff)),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '18.5 - 25 kg/m2',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      bmiResultSubTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
              label: "Re-Calculate",
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

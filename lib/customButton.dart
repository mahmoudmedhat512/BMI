import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xff4c4f5e),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
            width: 200.0,
            height: 60.0,
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: kLabelCustomButtonStyle
              ),
            )),
      ),
    );
  }
}

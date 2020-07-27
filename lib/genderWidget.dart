

import 'package:flutter/material.dart';
import 'constant.dart';
class GenderWidget extends StatelessWidget {
  
  final IconData icon;
  final String label;

  const GenderWidget({@required this.icon, @required this.label});
   
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          // FontAwesomeIcons.mars,
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,style:kLabelStyle ),
      ],
    );
  }
}


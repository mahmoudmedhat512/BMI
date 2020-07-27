import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color colored;
  final Widget cardChild;
  final Function onPress;
  const CustomCard({@required this.colored, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colored,
        ),
        child: cardChild,
      ),
    );
  }
}

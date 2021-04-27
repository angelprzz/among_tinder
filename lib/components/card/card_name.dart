import 'package:flutter/material.dart';

class CardName extends StatelessWidget {
  CardName({
    @required this.name,
    this.fontSize = 30.0,
    this.containerHeight = 55.0,
    this.verticalPadding = 10.0,
    this.horizontalPadding = 15.0,
    this.backgroundColor,
  });

  final String name;

  final double fontSize;

  final double containerHeight;

  final double verticalPadding;

  final double horizontalPadding;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: containerHeight,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        width: MediaQuery.of(context).size.width,
        color: backgroundColor ?? Color.fromRGBO(0, 0, 0, 0.35),
        child: Text(
          name,
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: fontSize,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
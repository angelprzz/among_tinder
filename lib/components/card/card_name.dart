import 'package:flutter/material.dart';

class CardName extends StatelessWidget {
  CardName({
    this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(0, 0, 0, 0.35),
        child: Text(
          name,
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 30,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
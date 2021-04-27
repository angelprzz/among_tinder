import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  CardImage({
    @required this.imageRoute,
    this.padding = 16.0,
    this.borderRadius = 150.0,
  });

  final String imageRoute;

  final double padding;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              imageRoute,
            ),
          )
      ),
    );
  }
}
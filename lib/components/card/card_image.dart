import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  CardImage({
    this.imageRoute
  });

  final String imageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              imageRoute,
            ),
          )
      ),
    );
  }
}
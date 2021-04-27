import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class TinderCard extends StatelessWidget {

  TinderCard({
    @required this.controller,
    @required this.totalNum,
    @required this.cardBuilder,
    @required this.swipeCompleteCallback,
  });

  final CardController controller;

  final int totalNum;

  final cardBuilder;

  final swipeCompleteCallback;

  @override
  Widget build(BuildContext context) {
    return TinderSwapCard(
      swipeUp: true,
      swipeDown: true,
      orientation: AmassOrientation.BOTTOM,
      totalNum: totalNum,
      stackNum: 3,
      swipeEdge: 4.0,
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.width * 0.9,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      minHeight: MediaQuery.of(context).size.width * 0.7,
      cardBuilder: cardBuilder,
      cardController: controller,
      swipeCompleteCallback: swipeCompleteCallback
    );
  }
}
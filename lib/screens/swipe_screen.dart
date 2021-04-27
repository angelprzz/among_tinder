import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:among_tinder/model/amongus_character.dart';
import 'package:among_tinder/providers/providers.dart';
import 'package:among_tinder/helpers/color_helper.dart';
import 'package:among_tinder/components/components.dart';

class SwipeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    CardController controller;
    final characterState = watch(charactersProvider);

    return characterState.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => const Text('Oops'),
      data: (characterState) {
        return Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TinderCard(
                controller: controller,
                totalNum: characterState.length,
                cardBuilder: (context, index) => Card(
                  color: hexToColor(characterState[index].hexColor.toString()),
                  child: Stack(
                    children: [
                      CardImage(
                        imageRoute: 'assets/${characterState[index].image}',
                      ),
                      CardName(name: characterState[index].name)
                    ],
                  ),
                ),
                swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                  if(orientation == CardSwipeOrientation.RIGHT) {
                    context.read(likeNotifierProvider).add(characterState[index]);
                  }
                },
              )
          ),
        );
      },
    );
  }
}
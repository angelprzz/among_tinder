import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:among_tinder/providers/providers.dart';
import 'package:among_tinder/helpers/color_helper.dart';
import 'package:among_tinder/components/components.dart';

class SwipeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    CardController controller;
    final characterState = watch(charactersProvider);
    final likeChangeNotifier = watch(likeChangeNotifierProvider);

    return characterState.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => const Text('Oops'),
      data: (characterState) {
        return Center(
          child: likeChangeNotifier.likes.length + likeChangeNotifier.dislikes.length != characterState.length
          ? Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: TinderCard(
                    controller: controller = CardController(),
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
                        likeChangeNotifier.like(characterState[index]);
                      } else if (orientation == CardSwipeOrientation.LEFT) {
                        likeChangeNotifier.dislike(characterState[index]);
                      }
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Dislike'),
                    onPressed: () => controller.triggerLeft(),
                  ),
                  ElevatedButton(
                    child: Text('Like'),
                    onPressed: () => controller.triggerRight(),
                  ),
                ],
              )
            ],
          )
          : Text("There is no one new around you."),
        );
      },
    );
  }
}
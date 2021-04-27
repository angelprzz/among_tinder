import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:among_tinder/model/amongus_character.dart';
import 'package:among_tinder/providers/providers.dart';
import 'package:among_tinder/helpers/color_helper.dart';
import 'package:among_tinder/components/components.dart';

class SwipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Consumer(
          builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
            return watch(charactersProvider).map(
              data: (AsyncData<List<AmongUsCharacter>> characters) {
                return TinderCard(
                  controller: controller,
                  totalNum: characters.data.value.length,
                  cardBuilder: (context, index) => Card(
                    color: hexToColor(characters.value[index].hexColor.toString()),
                    child: Stack(
                      children: [
                        CardImage(
                          imageRoute: 'assets/${characters.data.value[index].image}',
                        ),
                        CardName(name: characters.data.value[index].name)
                      ],
                    ),
                  ),
                  swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                    if(orientation == CardSwipeOrientation.RIGHT) {
                      context.read(likeNotifierProvider).add(characters.value[index]);
                    }
                  },
                );
              },
              error: (AsyncError<List<AmongUsCharacter>> value) => Text("Error"),
              loading: (AsyncLoading<List<AmongUsCharacter>> value) => CircularProgressIndicator()
            );
          },
        ),
      ),
    );
  }
}
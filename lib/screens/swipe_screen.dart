import 'package:among_tinder/model/amongus_character.dart';
import 'package:among_tinder/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

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
                return TinderSwapCard(
                  swipeUp: true,
                  swipeDown: true,
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: characters.data.value.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(
                    color: hexToColor(characters.value[index].hexColor.toString()),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset(
                                  'assets/${characters.data.value[index].image}',
                                ),
                              )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 55,
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromRGBO(0, 0, 0, 0.35),
                            child: Text(
                              characters.data.value[index].name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                  },
                );
              },
              error: (AsyncError<List<AmongUsCharacter>> value) {
                return Text("Error");
              },
              loading: (AsyncLoading<List<AmongUsCharacter>> value) {
                return CircularProgressIndicator();
              },
            );
          },
        ),
      ),
      // child: Column(
      //   children: [
      //     Consumer(
      //       builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
      //         return watch(charactersProvider).map(
      //           data: (AsyncData<List<AmongUsCharacter>> characters) {
      //             return TinderSwapCard(
      //               swipeUp: true,
      //               swipeDown: true,
      //               orientation: AmassOrientation.BOTTOM,
      //               totalNum: characters.data.value.length,
      //               stackNum: 3,
      //               swipeEdge: 4.0,
      //               maxWidth: MediaQuery.of(context).size.width * 0.9,
      //               maxHeight: MediaQuery.of(context).size.width * 0.9,
      //               minWidth: MediaQuery.of(context).size.width * 0.8,
      //               minHeight: MediaQuery.of(context).size.width * 0.8,
      //               cardBuilder: (context, index) => Card(
      //                 child: Image.asset('assets/crewmate-${index + 1}.png'),
      //               ),
      //               cardController: controller = CardController(),
      //               swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
      //                 /// Get swiping card's alignment
      //                 if (align.x < 0) {
      //                   //Card is LEFT swiping
      //                 } else if (align.x > 0) {
      //                   //Card is RIGHT swiping
      //                 }
      //               },
      //               swipeCompleteCallback:
      //                   (CardSwipeOrientation orientation, int index) {
      //                 /// Get orientation & index of swiped card!
      //               },
      //             );
      //           },
      //           error: (AsyncError<List<AmongUsCharacter>> value) {
      //             return Text("Error");
      //           },
      //           loading: (AsyncLoading<List<AmongUsCharacter>> value) {
      //             return CircularProgressIndicator();
      //           },
      //         );
      //       },
      //     ),
      //     // Row(
      //     //   crossAxisAlignment: CrossAxisAlignment.center,
      //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //   children: [
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text('Dislike'),
      //     //     ),
      //     //     ElevatedButton(onPressed: null, child: Text('Like'),)
      //     //   ],
      //     // ),
      //   ],
      // ),
    );
  }
}
import 'package:among_tinder/model/amongus_character.dart';
import 'package:among_tinder/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        builder: (BuildContext context, T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
          return watch(charactersProvider).map(
            data: (AsyncData<List<AmongUsCharacter>> characters) {
              return ListView.builder(
                itemCount: characters.data.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(characters.data.value[index].name);
                }
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
      )
    );
  }
}
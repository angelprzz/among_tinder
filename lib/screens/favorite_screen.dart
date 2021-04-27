import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:among_tinder/components/list_item.dart';
import 'package:among_tinder/providers/providers.dart';

class FavoriteScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final likeNotifierState = watch(likeNotifierProvider);
    return Center(
      child: ListView.builder(
          itemCount: likeNotifierState.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              title: likeNotifierState[index].name,
              imageRoute: 'assets/${likeNotifierState[index].image}',
            );
          }
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:among_tinder/components/list_item.dart';
import 'package:among_tinder/providers/providers.dart';

class FavoriteScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final likeChangeNotifierState = watch(likeChangeNotifierProvider);
    return Center(
      child: likeChangeNotifierState.likes.length != 0 ?
        ListView.builder(
          itemCount: likeChangeNotifierState.likes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              title: likeChangeNotifierState.likes[index].name,
              imageRoute: 'assets/${likeChangeNotifierState.likes[index].image}',
            );
          }
        ) : Text("No likes given yet.")
    );
  }
}
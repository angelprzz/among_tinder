import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:among_tinder/model/amongus_character.dart';

class LikeChangeNotifier extends ChangeNotifier{
  final List<AmongUsCharacter> _likes = [];
  final List<AmongUsCharacter> _dislikes = [];

  UnmodifiableListView<AmongUsCharacter> get likes => UnmodifiableListView(_likes);
  UnmodifiableListView<AmongUsCharacter> get dislikes => UnmodifiableListView(_dislikes);

  void like(AmongUsCharacter character) {
    _likes.add(character);
    notifyListeners();
  }

  void dislike(AmongUsCharacter character) {
    _dislikes.add(character);
    notifyListeners();
  }
}
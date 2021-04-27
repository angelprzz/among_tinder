import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:among_tinder/model/amongus_character.dart';

class LikeChangeNotifier extends ChangeNotifier{
  final List<AmongUsCharacter> _likes = [];

  UnmodifiableListView<AmongUsCharacter> get likes => UnmodifiableListView(_likes);

  void add(AmongUsCharacter character) {
    _likes.add(character);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:collection';
import 'package:flutter/services.dart' show rootBundle;
import 'package:among_tinder/model/amongus_character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider<Repository>((ref) => Repository());

class Repository {
  Future<List<AmongUsCharacter>> fetchCharactersData() async {
    var jsonString = await rootBundle.loadString('data/character_data.json');
    var decodedJsonData = json.decode(jsonString);
    var characterJsonList = (decodedJsonData as List);
    List<AmongUsCharacter> characterList = characterJsonList.map((e) => AmongUsCharacter.fromJson(e)).toList();
    return characterList;
  }
}

class LikeChangeNotifier extends ChangeNotifier{
  final List<AmongUsCharacter> _likes = [];
  
  UnmodifiableListView<AmongUsCharacter> get likes => UnmodifiableListView(_likes);

  void add(AmongUsCharacter character) {
    _likes.add(character);
    notifyListeners();
  }
}
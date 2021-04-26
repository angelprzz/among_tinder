import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:among_tinder/model/amongus_character.dart';

Future<List<AmongUsCharacter>> fetchCharactersData() async {
  var jsonString = await rootBundle.loadString('data/character_data.json');
  var decodedJsonData = json.decode(jsonString);
  var characterJsonList = (decodedJsonData as List);
  List<AmongUsCharacter> characterList = characterJsonList.map((e) => AmongUsCharacter.fromJson(e)).toList();
  return characterList;
}
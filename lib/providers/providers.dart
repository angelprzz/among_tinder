import 'package:among_tinder/model/amongus_character.dart';
import 'package:among_tinder/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final charactersProvider = FutureProvider<List<AmongUsCharacter>>((ref) async {
  return ref.read(repositoryProvider).fetchCharactersData();
});
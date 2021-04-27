import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:among_tinder/repository/repository.dart';
import 'package:among_tinder/model/amongus_character.dart';

final charactersProvider = FutureProvider<List<AmongUsCharacter>>((ref) async {
  return ref.read(repositoryProvider).fetchCharactersData();
});

final likeNotifierProvider = StateNotifierProvider<LikesNotifier, List<AmongUsCharacter>>((ref) {
  return LikesNotifier();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:among_tinder/repositories/repository.dart';
import 'package:among_tinder/model/amongus_character.dart';
import 'package:among_tinder/state/notifiers.dart';

final charactersProvider = FutureProvider<List<AmongUsCharacter>>((ref) async {
  return ref.read(repositoryProvider).fetchCharactersData();
});

final likeChangeNotifierProvider = ChangeNotifierProvider<LikeChangeNotifier>((ref) {
  return LikeChangeNotifier();
});
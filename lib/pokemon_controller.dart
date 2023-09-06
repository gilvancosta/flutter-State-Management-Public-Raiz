import 'package:flutter/material.dart';
import 'pokemon_service.dart';
import 'pokemon_state.dart';

class PokemonController extends ChangeNotifier {
  final service = PokemonService();

  var state = PokemonsState.empty();




  getPokemons() async {
    state = state.copyWith(error: '', isLoading: true);
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = state.copyWith(isLoading: false, pokemons: pokemons);
      notifyListeners();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());

      notifyListeners();
    }
  }
}

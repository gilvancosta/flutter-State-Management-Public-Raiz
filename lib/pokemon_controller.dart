import 'package:flutter/material.dart';
import 'pokemon_service.dart';
import 'pokemon_state.dart';

class PokemonController extends ChangeNotifier {
  final service = PokemonService();

  PokemonState  state   = EmptyPokemonState();




  getPokemons() async {
    state = LoadingPokemonState();
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();
      state = GettedPokemonState(pokemons);
      notifyListeners();
    } catch (e) {
      state = ErrorPokemonState(e.toString());

      notifyListeners();
    }
  }
}

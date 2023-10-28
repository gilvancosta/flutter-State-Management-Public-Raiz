// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../entities/pokemon/pokemon_model.dart';

sealed class PokemonState {}

class EmptyPokemonState implements PokemonState {}

class LoadingPokemonState implements PokemonState {}

class ErrorPokemonState implements PokemonState {
  final String message;
  ErrorPokemonState(this.message);
}

class GettedPokemonState implements PokemonState {
  final List<Pokemon> pokemons;
  GettedPokemonState(
    this.pokemons,
  );
}


/* 

class PokemonsState {
  final bool isLoading;
  final String error;
  final List<Pokemon> pokemons;

  PokemonsState({
    required this.isLoading,
    required this.error,
    required this.pokemons,
  });

  factory PokemonsState.empty() {
    return PokemonsState(
      error: '',
      isLoading: false,
      pokemons: [],
    );
  }

  PokemonsState copyWith({
    bool? isLoading,
    String? error,
    List<Pokemon>? pokemons,
  }) {
    return PokemonsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
 */
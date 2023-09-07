//import 'package:dio/dio.dart';

import 'pokemon_model.dart';

class PokemonService {
  // final dio = Dio();
  Future<List<Pokemon>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      Pokemon(name: 'Picachu'),
      Pokemon(name: 'Charmander'),
      Pokemon(name: 'Bulbasaur'),
      Pokemon(name: 'Squirtle'),
      Pokemon(name: 'Pidgey'),
      Pokemon(name: 'Rattata'),
      Pokemon(name: 'Ekans'),
      Pokemon(name: 'Pikachu'),
    ];
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'pokemon_controller.dart';

/// principios do gerenciamento de estado
/// 1. o estado é uma variavel que represeta o estado
/// 2. o estado é imutavel
/// 3. registre o ouvinte para ser notificado quando o estado mudar
/// 4. o estado é gerenciado pelo widget pai
///

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final store = PokemonController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: store,
        builder: (context, child) {
          Widget body = Container();
          final state = store.state;
          if (state.isLoading) {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error.isNotEmpty) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons(),
                child: Text(state.error),
              ),
            );
          } else if (state.pokemons.isNotEmpty) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons(),
                child: const Text('Toque Aqui!'),
              ),
            );
          } else {
            body = ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                return ListTile(
                  title: Text(pokemon.name),
                );
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokemon'),
            ),
            body: body,
          );
        });
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:example_state_management_raiz/app/repository/pokemon_state.dart';
import 'package:flutter/material.dart';
import '../pokemon/pokemon_controller.dart';

/// principios do gerenciamento de estado
/// 1. o estado é uma variavel que representa o estado
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

  //final service = PokemonService();

  // final store = PokemonController();
  final store = PokemonController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (ccontext, child) {
        Widget body = Container();
        final state = store.state;

        if (state is LoadingPokemonState) {
          body = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorPokemonState) {
          body = Center(child: ElevatedButton(onPressed: store.getPokemons, child: Text(state.message)));
        } else if (state is EmptyPokemonState) {
          body = Center(child: ElevatedButton(onPressed: store.getPokemons, child: const Text('Toque Aqui!')));
        } else if (state is GettedPokemonState) {
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
            title: Text(title),
          ),
          body: body,
        );
      },
    );
  }
}

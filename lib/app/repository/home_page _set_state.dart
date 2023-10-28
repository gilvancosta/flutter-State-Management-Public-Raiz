// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_state_management_raiz/app/services/pokemon_service.dart';
import 'package:flutter/material.dart';
import '../entities/pokemon/pokemon_model.dart';

/// principios do gerenciamento de estado
/// 1. o estado é uma variavel que represeta o estado
/// 2. o estado é imutavel
/// 3. registre o ouvinte para ser notificado quando o estado mudar
/// 4. o estado é gerenciado pelo widget pai
///

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final service = PokemonService();
  // final store = PokemonController();
  var isLoaading = false;
  var error = '';
  var pokemons = <Pokemon>[];

  getPokemons() async {
    setState(() {
      isLoaading = true;
      error = '';
    });

    try {
      final pokemons = await service.fetchAll();
      setState(() {
        this.pokemons = pokemons;
        isLoaading = false;
      });
    } catch (e) {
      setState(() {
        isLoaading = false;
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    if (isLoaading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error.isNotEmpty) {
      body = Center(child: ElevatedButton(onPressed: getPokemons, child: Text(error)));
    } else if (pokemons.isEmpty) {
      body = Center(child: ElevatedButton(onPressed: getPokemons, child: const Text('Toque Aqui!')));
    } else {
      body = ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
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
  }
}

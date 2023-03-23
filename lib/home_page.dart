import 'package:pokedex_start/state/action/pokemon_actions.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_start/utilities/string_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, GetPokemonsAction());
    StoreProvider.dispatch(context, GetPokemonDetailsAction(pokemonName: samplePokemonName));

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          // TODO: This text will be remove
          child: Text('This app is working'),
        ),
      ),
    );
  }
}

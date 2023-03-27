import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_card.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:flutter/material.dart';

class PokemonGridView extends StatelessWidget {
  PokemonGridView({
    super.key,
    required this.pokemons,
  });

  List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridRowCount,
        childAspectRatio: cardRatio,
      ),
      itemBuilder: (_, int index) {
        final pokemon = pokemons[index];
        return PokemonCard(pokemon: pokemon);
      },
    );
  }
}

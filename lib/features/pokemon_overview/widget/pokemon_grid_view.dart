import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_card.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:flutter/material.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({
    required this.pokemons,
    this.shouldShowFallbackLabel = false,
    super.key,
  });

  final List<Pokemon> pokemons;
  final bool shouldShowFallbackLabel;

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty && shouldShowFallbackLabel) {
      return const Center(child: BodySmallText(text: noSearchResultsFoundMessage));
    }

    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridRowCount,
        childAspectRatio: cardRatio,
      ),
      itemBuilder: (_, index) {
        final pokemon = pokemons[index];
        return PokemonCard(pokemon: pokemon);
      },
    );
  }
}

import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_card.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    super.key,
  });

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName)),
      body: Center(
        child: pokemons.when(
          (data) => GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridRowCount,
              childAspectRatio: cardRatio,
            ),
            itemBuilder: (_, int index) {
              final pokemon = data[index];
              return PokemonCard(pokemon: pokemon);
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (errorMessage) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage ?? emptyString));
            return const Text(errorMessageDefault);
          },
        ),
      ),
    );
  }
}

void _showErrorMessageSnackbar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(content: Text(errorMessage));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

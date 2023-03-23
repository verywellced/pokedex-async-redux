import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_grid_view.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/widget/app_scaffold.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    super.key,
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty) {
      return const AppScaffold(
        appBarText: appName,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return AppScaffold(
      appBarText: appName,
      body: Center(
        child: PokemonGridView(pokemons: pokemons),
      ),
    );
  }
}

import 'package:pokedex_start/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => const PokemonOverviewConnector(),
  PokemonDetailsConnector.routeName: (BuildContext context) => const PokemonDetailsConnector()
};

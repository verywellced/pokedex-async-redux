import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_page.dart';
import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_vm.dart';
import 'package:pokedex_start/state/action/pokemon_actions.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class PokemonOverviewConnector extends StatelessWidget {
  const PokemonOverviewConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonOverviewVm>(
      vm: () => PokemonOverviewFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonsAction()),
      builder: (context, vm) => MaterialApp(home: PokemonOverviewPage(pokemons: vm.pokemons)),
    );
  }
}

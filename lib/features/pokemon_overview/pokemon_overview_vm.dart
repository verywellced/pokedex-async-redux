import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/state/action/pokemon_actions.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class PokemonOverviewFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(
        pokemons: _pokemons(),
        searchedPokemons: state.searchedPokemons,
        getFilterPokemons: (queryText) => _getFilteredPokemons(queryText),
        clearSearchedPokemons: _clearSearchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(emptyPokemonsMessage);
    return Async(state.pokemons);
  }

  void _getFilteredPokemons(String queryText) => dispatchSync(SearchPokemonsAction(queryText: queryText));
  void _clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
    required this.searchedPokemons,
    required this.getFilterPokemons,
    required this.clearSearchedPokemons,
  }) : super(equals: [pokemons, searchedPokemons]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback clearSearchedPokemons;
  final Function(String) getFilterPokemons;
}

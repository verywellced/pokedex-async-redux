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
        searchedPokemons: _getSearchedPokemons,
        onSearchPokemons: _onSearchPokemons,
        onClearSearchedPokemons: _onClearSearchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(emptyPokemonsMessage);
    return Async(state.pokemons);
  }

  void _onSearchPokemons(queryText) => dispatchSync(SearchPokemonsAction(queryText: queryText));

  void _onClearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());

  List<Pokemon> get _getSearchedPokemons => state.searchedPokemons;
}

class PokemonOverviewVm<T> extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
    required this.searchedPokemons,
    required this.onSearchPokemons,
    required this.onClearSearchedPokemons,
  }) : super(equals: [
          pokemons,
          searchedPokemons,
        ]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback onClearSearchedPokemons;
  final ValueChanged<T> onSearchPokemons;
}

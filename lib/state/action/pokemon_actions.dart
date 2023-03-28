import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:pokedex_start/api/api_service.dart';
import 'package:pokedex_start/state/action/actions.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/utilities/constant.dart';

/// Getting of pokemons from pokemon API
class GetPokemonsAction extends LoadingAction {
  static const key = 'get-pokemons-action';

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(
          offset: offsetDefault,
          limit: limitDefault,
        );
    return state.copyWith(pokemons: pokemons);
  }
}

/// Getting the details of a pokemon
class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get-pokemon-details-action';

  GetPokemonDetailsAction({required this.pokemonName}) : super(actionKey: key);

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final currentPokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);
    return state.copyWith(currentPokemonDetails: currentPokemonDetails);
  }
}

/// Clearing the pokemon details on the store
class ClearPokemonDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(currentPokemonDetails: null);
}

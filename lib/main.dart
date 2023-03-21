import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_start/api/api_service.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/home_page.dart';
import 'package:flutter/material.dart';

// TODO : Future in the main class to be removed
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

// TODO: API testing code for pokemon list  to be removed
  final pokemons =
      await ApiService().pokemonApi.getPokemonList(offset: '0', limit: '151');
  pokemons;

  // TODO: API testing code for pokemon details to be removed
  final pokemonDetails =
      await ApiService().pokemonApi.getPokemonDetails(name: 'bulbasaur');

  pokemonDetails;

  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );
}

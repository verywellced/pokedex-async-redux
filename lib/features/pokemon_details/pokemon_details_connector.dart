import 'package:pokedex_start/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex_start/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex_start/state/action/pokemon_actions.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({super.key});

  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailsArguments;

    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemonName: args.pokemonName)),
      onDispose: (store) => store.dispatchSync(DisposePokemonDetailsAction()),
      builder: (context, vm) => PokemonDetailsPage(pokemonDetails: vm.pokemonDetails),
    );
  }
}

class DetailsArguments {
  final String pokemonName;
  DetailsArguments(this.pokemonName);
}

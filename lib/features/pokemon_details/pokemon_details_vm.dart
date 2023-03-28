import 'package:pokedex_start/api/model/pokemon_details.dart';
import 'package:pokedex_start/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_start/state/action/pokemon_actions.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:async_redux/async_redux.dart';

class PokemonDetailsFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm fromStore() => PokemonDetailsVm(pokemonDetails: _pokemonDetails());

  Async<PokemonDetails> _pokemonDetails() {
    if (state.wait.isWaitingFor(GetPokemonDetailsAction.key)) return const Async.loading();
    if (state.currentPokemonDetails == null) return const Async.error(errorPokemonDetailsIsEmpty);
    return Async(state.currentPokemonDetails!);
  }
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({
    required this.pokemonDetails,
  }) : super(equals: [pokemonDetails]);

  final Async<PokemonDetails> pokemonDetails;
}

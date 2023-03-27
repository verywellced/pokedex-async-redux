import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/state/action/pokemon_actions.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:async_redux/async_redux.dart';

class PokemonOverviewFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: _pokemons());

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(emptyPokemonsMessage);
    return Async(state.pokemons);
  }
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
  }) : super(equals: [pokemons]);

  final Async<List<Pokemon>> pokemons;
}

import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

class PokemonOverviewFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: _pokemons);

  List<Pokemon> get _pokemons => state.pokemons;
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
  }) : super(equals: [pokemons]);

  final List<Pokemon> pokemons;
}

import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_start/api/model/pokemon_details.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    // TODO: This one will be removed
    @Default('') String sample,
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
    @Default(null) PokemonDetails? currentPokemonDetails,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}

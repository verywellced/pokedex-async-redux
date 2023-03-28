import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/api/model/pokemon_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:async_redux/async_redux.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    // TODO: This one will be removed
    @Default('') String sample,
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
    @Default(null) PokemonDetails? currentPokemonDetails,

    //ignored by state
    @Default(Wait.empty) @JsonKey(ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}

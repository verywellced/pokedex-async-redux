import 'package:pokedex_start/api/model/pokemon_ability.dart';
import 'package:pokedex_start/api/model/pokemon_move.dart';
import 'package:pokedex_start/api/model/pokemon_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details.freezed.dart';
part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'abilities') required List<PokemonAbility> abilityList,
    @JsonKey(name: 'moves') required List<PokemonMove> moveList,
    @JsonKey(name: 'stats') required List<PokemonStats> statList,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);
}

import 'package:pokedex_start/api/model/ability.dart';
import 'package:pokedex_start/api/model/move.dart';
import 'package:pokedex_start/api/model/stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details.freezed.dart';
part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'abilities') required List<Ability> abilityList,
    @JsonKey(name: 'moves') required List<Move> moveList,
    @JsonKey(name: 'stats') required List<Stats> statList,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}

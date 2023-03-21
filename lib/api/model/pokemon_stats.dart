import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_start/api/model/pokemon_stat.dart';

part 'pokemon_stats.freezed.dart';
part 'pokemon_stats.g.dart';

@freezed
class PokemonStats with _$PokemonStats {
  factory PokemonStats({
    @JsonKey(name: 'base_stat') required int baseStats,
    @JsonKey(name: 'stat') required PokemonStat stat,
  }) = _PokemonStats;

  factory PokemonStats.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsFromJson(json);
}

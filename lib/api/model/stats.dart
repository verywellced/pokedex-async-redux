import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_start/api/model/stat.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    @JsonKey(name: 'base_stat') required int baseStats,
    @JsonKey(name: 'stat') required Stat stat,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

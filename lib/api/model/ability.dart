import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_start/api/model/ability_details.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
class Ability with _$Ability {
  factory Ability({
    @JsonKey(name: 'ability') required AbilityDetails abilityDetails,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_start/api/model/move_details.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    @JsonKey(name: 'move') required MoveDetails moveDetails,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}

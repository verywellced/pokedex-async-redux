import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_details.freezed.dart';
part 'move_details.g.dart';

@freezed
class MoveDetails with _$MoveDetails {
  factory MoveDetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _MoveDetails;

  factory MoveDetails.fromJson(Map<String, dynamic> json) => _$MoveDetailsFromJson(json);
}

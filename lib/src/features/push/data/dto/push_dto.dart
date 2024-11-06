import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_dto.freezed.dart';
part 'push_dto.g.dart';

@freezed
class PushDto with _$PushDto {
  const factory PushDto({
    required String title,
    required String message,
    DateTime? pushTime,
  }) = _PushDto;

  factory PushDto.fromJson(Map<String, Object?> json) => _$PushDtoFromJson(json);
}

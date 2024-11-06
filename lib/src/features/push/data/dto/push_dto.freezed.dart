// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PushDto _$PushDtoFromJson(Map<String, dynamic> json) {
  return _PushDto.fromJson(json);
}

/// @nodoc
mixin _$PushDto {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime? get pushTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushDtoCopyWith<PushDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushDtoCopyWith<$Res> {
  factory $PushDtoCopyWith(PushDto value, $Res Function(PushDto) then) =
      _$PushDtoCopyWithImpl<$Res, PushDto>;
  @useResult
  $Res call({String title, String message, DateTime? pushTime});
}

/// @nodoc
class _$PushDtoCopyWithImpl<$Res, $Val extends PushDto>
    implements $PushDtoCopyWith<$Res> {
  _$PushDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? pushTime = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pushTime: freezed == pushTime
          ? _value.pushTime
          : pushTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushDtoImplCopyWith<$Res> implements $PushDtoCopyWith<$Res> {
  factory _$$PushDtoImplCopyWith(
          _$PushDtoImpl value, $Res Function(_$PushDtoImpl) then) =
      __$$PushDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message, DateTime? pushTime});
}

/// @nodoc
class __$$PushDtoImplCopyWithImpl<$Res>
    extends _$PushDtoCopyWithImpl<$Res, _$PushDtoImpl>
    implements _$$PushDtoImplCopyWith<$Res> {
  __$$PushDtoImplCopyWithImpl(
      _$PushDtoImpl _value, $Res Function(_$PushDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? pushTime = freezed,
  }) {
    return _then(_$PushDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      pushTime: freezed == pushTime
          ? _value.pushTime
          : pushTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushDtoImpl implements _PushDto {
  const _$PushDtoImpl(
      {required this.title, required this.message, this.pushTime});

  factory _$PushDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String message;
  @override
  final DateTime? pushTime;

  @override
  String toString() {
    return 'PushDto(title: $title, message: $message, pushTime: $pushTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pushTime, pushTime) ||
                other.pushTime == pushTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, message, pushTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushDtoImplCopyWith<_$PushDtoImpl> get copyWith =>
      __$$PushDtoImplCopyWithImpl<_$PushDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushDtoImplToJson(
      this,
    );
  }
}

abstract class _PushDto implements PushDto {
  const factory _PushDto(
      {required final String title,
      required final String message,
      final DateTime? pushTime}) = _$PushDtoImpl;

  factory _PushDto.fromJson(Map<String, dynamic> json) = _$PushDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get message;
  @override
  DateTime? get pushTime;
  @override
  @JsonKey(ignore: true)
  _$$PushDtoImplCopyWith<_$PushDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

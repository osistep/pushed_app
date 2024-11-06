// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PushDtoImpl _$$PushDtoImplFromJson(Map<String, dynamic> json) =>
    _$PushDtoImpl(
      title: json['title'] as String,
      message: json['message'] as String,
      pushTime: json['pushTime'] == null
          ? null
          : DateTime.parse(json['pushTime'] as String),
    );

Map<String, dynamic> _$$PushDtoImplToJson(_$PushDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'pushTime': instance.pushTime?.toIso8601String(),
    };

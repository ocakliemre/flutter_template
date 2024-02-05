// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogRequestModel _$LogRequestModelFromJson(Map<String, dynamic> json) =>
    LogRequestModel(
      id: json['id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      platform: $enumDecodeNullable(_$LogPlatformEnumMap, json['platform']),
      thread: json['thread'] as String?,
      level: $enumDecodeNullable(_$LogLevelEnumMap, json['level']),
      logger: json['logger'] as String?,
      message: json['message'] as String?,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$LogRequestModelToJson(LogRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'platform': _$LogPlatformEnumMap[instance.platform],
      'logger': instance.logger,
      'thread': instance.thread,
      'level': _$LogLevelEnumMap[instance.level],
      'message': instance.message,
      'exception': instance.exception,
    };

const _$LogPlatformEnumMap = {
  LogPlatform.web: 1,
  LogPlatform.android: 2,
  LogPlatform.ios: 3,
  LogPlatform.other: 4,
};

const _$LogLevelEnumMap = {
  LogLevel.error: 'ERROR',
  LogLevel.info: 'INFO',
};

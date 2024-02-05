// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogResponseModel _$LogResponseModelFromJson(Map<String, dynamic> json) =>
    LogResponseModel(
      id: json['id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      thread: json['thread'] as String?,
      level: json['level'] as String?,
      logger: json['logger'] as String?,
      message: json['message'] as String?,
      exception: json['exception'] as String?,
      platform: json['platform'] as int?,
    );

Map<String, dynamic> _$LogResponseModelToJson(LogResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'thread': instance.thread,
      'level': instance.level,
      'logger': instance.logger,
      'message': instance.message,
      'exception': instance.exception,
      'platform': instance.platform,
    };

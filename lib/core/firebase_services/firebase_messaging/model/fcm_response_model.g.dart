// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmResponseModel _$FcmResponseModelFromJson(Map<String, dynamic> json) =>
    FcmResponseModel(
      to: json['to'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      android: json['android'] == null
          ? null
          : Android.fromJson(json['android'] as Map<String, dynamic>),
      ios: json['ios'] == null
          ? null
          : Ios.fromJson(json['ios'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FcmResponseModelToJson(FcmResponseModel instance) =>
    <String, dynamic>{
      'to': instance.to,
      'data': instance.data?.toJson(),
      'android': instance.android?.toJson(),
      'ios': instance.ios?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      fcmType: $enumDecodeNullable(_$FcmTypeEnumMap, json['fcmType']),
      title: json['title'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'fcmType': _$FcmTypeEnumMap[instance.fcmType],
      'title': instance.title,
      'message': instance.message,
    };

const _$FcmTypeEnumMap = {
  FcmType.pushNotification: 'pushNotification',
  FcmType.locationRequest: 'locationRequest',
};

Android _$AndroidFromJson(Map<String, dynamic> json) => Android(
      priority: json['priority'] as String?,
    );

Map<String, dynamic> _$AndroidToJson(Android instance) => <String, dynamic>{
      'priority': instance.priority,
    };

Ios _$IosFromJson(Map<String, dynamic> json) => Ios(
      contentAvailable: json['contentAvailable'] as String?,
    );

Map<String, dynamic> _$IosToJson(Ios instance) => <String, dynamic>{
      'contentAvailable': instance.contentAvailable,
    };

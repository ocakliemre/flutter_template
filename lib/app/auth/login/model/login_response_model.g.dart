// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      visible: json['visible'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'success': instance.success,
      'visible': instance.visible,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      claims:
          (json['claims'] as List<dynamic>?)?.map((e) => e as String).toList(),
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiration: json['expiration'] as String?,
    )..userId = json['userId'] as int?;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'claims': instance.claims,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'expiration': instance.expiration,
      'userId': instance.userId,
    };

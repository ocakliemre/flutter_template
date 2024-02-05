// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtModel _$JwtModelFromJson(Map<String, dynamic> json) => JwtModel(
      userId: json[
              'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']
          as String?,
      userName:
          json['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name']
              as String?,
      userRole: JwtModel._userRoleFromJson(
          json['http://schemas.microsoft.com/ws/2008/06/identity/claims/role']),
      nbf: json['nbf'] as int?,
      exp: json['exp'] as int?,
      iss: json['iss'] as String?,
      aud: json['aud'] as String?,
    );

Map<String, dynamic> _$JwtModelToJson(JwtModel instance) => <String, dynamic>{
      'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier':
          instance.userId,
      'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name':
          instance.userName,
      'http://schemas.microsoft.com/ws/2008/06/identity/claims/role':
          instance.userRole,
      'nbf': instance.nbf,
      'exp': instance.exp,
      'iss': instance.iss,
      'aud': instance.aud,
    };

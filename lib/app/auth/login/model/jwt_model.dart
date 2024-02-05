import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/model/base_model.dart';

part 'jwt_model.g.dart';

@JsonSerializable()
class JwtModel extends BaseModel<JwtModel> {
  @JsonKey(
      name:
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier')
  String? userId;
  @JsonKey(name: 'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name')
  String? userName;
  @JsonKey(
    name: 'http://schemas.microsoft.com/ws/2008/06/identity/claims/role',
    fromJson: _userRoleFromJson,
  )
  dynamic userRole;
  int? nbf;
  int? exp;
  String? iss;
  String? aud;

  JwtModel({
    this.userId,
    this.userName,
    this.userRole,
    this.nbf,
    this.exp,
    this.iss,
    this.aud,
  });

  @override
  JwtModel fromJson(Map<String, dynamic> json) {
    return _$JwtModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$JwtModelToJson(this);
  }

  factory JwtModel.fromJwtToken(String token) {
    String normalizedSource = base64Url.normalize(token.split(".")[1]);
    final decodedJson =
        jsonDecode(utf8.decode(base64Url.decode(normalizedSource)));

    return _$JwtModelFromJson(decodedJson);
  }

  static List<String?>? _userRoleFromJson(dynamic userRoleResponse) {
    List<String?>? result = [];

    if (userRoleResponse is List) {
      result = userRoleResponse.cast<String?>();
    } else if (userRoleResponse is String) {
      result = [userRoleResponse];
    }

    return result;
  }
}

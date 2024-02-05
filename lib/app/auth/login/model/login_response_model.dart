import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/model/base_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class LoginResponseModel extends BaseModel<LoginResponseModel> {
  Data? data;
  bool? success;
  bool? visible;
  String? message;

  LoginResponseModel({this.data, this.success, this.visible, this.message});

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      LoginResponseModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }
}

@JsonSerializable()
class Data extends BaseModel<Data> {
  List<String>? claims;
  String? token;
  String? refreshToken;
  String? expiration;
  int? userId;

  Data({this.claims, this.token, this.refreshToken, this.expiration});

  @override
  Data fromJson(Map<String, dynamic> json) => Data.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}

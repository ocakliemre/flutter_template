import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/model/base_model.dart';
import '../../../../core/cache/hive/constants/hive_constants.dart';

part 'login_request_model.g.dart';

@HiveType(typeId: HiveConstants.loginRequestModelId)
@JsonSerializable()
class LoginRequestModel extends BaseModel<LoginRequestModel> {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? password;

  LoginRequestModel({this.userName, this.password});

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) =>
      LoginRequestModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginRequestModelToJson(this);
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }
}

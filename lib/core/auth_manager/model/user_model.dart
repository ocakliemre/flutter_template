import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../app/auth/login/model/jwt_model.dart';
import '../../../app/auth/login/model/login_response_model.dart';
import '../../../app/auth/user/model/user_response_model.dart';
import '../../base/model/base_model.dart';
import '../../cache/hive/constants/hive_constants.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveConstants.userModelId)
@JsonSerializable()
class UserModel extends BaseModel<UserModel> {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  int? userId;
  @HiveField(2)
  String? token;
  @HiveField(3)
  String? refreshToken;
  @HiveField(4)
  DateTime? expiration;
  @HiveField(5)
  List<String>? claims;
  @HiveField(6)
  UserResponseModel? user;

  UserModel({
    this.userName,
    this.userId,
    this.token,
    this.refreshToken,
    this.expiration,
    this.claims,
    this.user,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  factory UserModel.fromLoginResponseModel(
      LoginResponseModel? loginResponseModel) {
    JwtModel jwtModel =
        JwtModel.fromJwtToken((loginResponseModel?.data?.token) ?? '');

    return UserModel(
      userName: jwtModel.userName,
      userId: loginResponseModel?.data?.userId,
      claims: loginResponseModel?.data?.claims,
      token: loginResponseModel?.data?.token,
      refreshToken: loginResponseModel?.data?.refreshToken,
      expiration:
          //DateTime.tryParse(loginResponseModel?.data?.expiration ?? DateTime.now().toString()) ,
          DateTime.parse(loginResponseModel?.data?.expiration ?? DateTime.now().toString()).toLocal() ,
    );
  }
}

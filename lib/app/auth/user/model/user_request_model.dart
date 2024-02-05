import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/model/base_model.dart';
import '../../../../core/cache/hive/constants/hive_constants.dart';

part 'user_request_model.g.dart';

@HiveType(typeId: HiveConstants.userRequestModelId)
@JsonSerializable()
class UserRequestModel extends BaseModel<UserRequestModel> {
  @HiveField(0)
  int? userID;
  @HiveField(1)
  int? userTypeId;
  @HiveField(2)
  int? customerId;
  @HiveField(3)
  String? userNameSurname;
  @HiveField(4)
  String? userMail;
  @HiveField(5)
  String? userName;
  @HiveField(6)
  String? userPassword;
  @HiveField(7)
  int? branchID;
  @HiveField(8)
  bool? isCommonAccount;
  @HiveField(9)
  String? userTimeStamp;
  @HiveField(10)
  bool? isWebUser;
  @HiveField(11)
  bool? isMobileUser;
  @HiveField(12)
  bool? isActive;
  @HiveField(13)
  String? userFcmId;


  UserRequestModel({
    this.userID,
    this.userTypeId,
    this.customerId,
    this.userNameSurname,
    this.userMail,
    this.userName,
    this.userPassword,
    this.branchID,
    this.isCommonAccount,
    this.userTimeStamp,
    this.isWebUser,
    this.isMobileUser,
    this.isActive,
    this.userFcmId,
  });
  @override
  fromJson(Map<String, dynamic> json) => UserRequestModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRequestModelToJson(this);
  }

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return _$UserRequestModelFromJson(json);
  }
}

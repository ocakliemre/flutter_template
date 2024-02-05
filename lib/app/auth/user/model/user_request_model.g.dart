// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRequestModelAdapter extends TypeAdapter<UserRequestModel> {
  @override
  final int typeId = 16;

  @override
  UserRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRequestModel(
      userID: fields[0] as int?,
      userTypeId: fields[1] as int?,
      customerId: fields[2] as int?,
      userNameSurname: fields[3] as String?,
      userMail: fields[4] as String?,
      userName: fields[5] as String?,
      userPassword: fields[6] as String?,
      branchID: fields[7] as int?,
      isCommonAccount: fields[8] as bool?,
      userTimeStamp: fields[9] as String?,
      isWebUser: fields[10] as bool?,
      isMobileUser: fields[11] as bool?,
      isActive: fields[12] as bool?,
      userFcmId: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserRequestModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.userTypeId)
      ..writeByte(2)
      ..write(obj.customerId)
      ..writeByte(3)
      ..write(obj.userNameSurname)
      ..writeByte(4)
      ..write(obj.userMail)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.userPassword)
      ..writeByte(7)
      ..write(obj.branchID)
      ..writeByte(8)
      ..write(obj.isCommonAccount)
      ..writeByte(9)
      ..write(obj.userTimeStamp)
      ..writeByte(10)
      ..write(obj.isWebUser)
      ..writeByte(11)
      ..write(obj.isMobileUser)
      ..writeByte(12)
      ..write(obj.isActive)
      ..writeByte(13)
      ..write(obj.userFcmId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) =>
    UserRequestModel(
      userID: json['userID'] as int?,
      userTypeId: json['userTypeId'] as int?,
      customerId: json['customerId'] as int?,
      userNameSurname: json['userNameSurname'] as String?,
      userMail: json['userMail'] as String?,
      userName: json['userName'] as String?,
      userPassword: json['userPassword'] as String?,
      branchID: json['branchID'] as int?,
      isCommonAccount: json['isCommonAccount'] as bool?,
      userTimeStamp: json['userTimeStamp'] as String?,
      isWebUser: json['isWebUser'] as bool?,
      isMobileUser: json['isMobileUser'] as bool?,
      isActive: json['isActive'] as bool?,
      userFcmId: json['userFcmId'] as String?,
    );

Map<String, dynamic> _$UserRequestModelToJson(UserRequestModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'userTypeId': instance.userTypeId,
      'customerId': instance.customerId,
      'userNameSurname': instance.userNameSurname,
      'userMail': instance.userMail,
      'userName': instance.userName,
      'userPassword': instance.userPassword,
      'branchID': instance.branchID,
      'isCommonAccount': instance.isCommonAccount,
      'userTimeStamp': instance.userTimeStamp,
      'isWebUser': instance.isWebUser,
      'isMobileUser': instance.isMobileUser,
      'isActive': instance.isActive,
      'userFcmId': instance.userFcmId,
    };

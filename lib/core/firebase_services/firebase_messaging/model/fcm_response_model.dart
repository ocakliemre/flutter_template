import 'package:json_annotation/json_annotation.dart';

import '../../../base/model/base_model.dart';

part 'fcm_response_model.g.dart';

enum FcmType {
  pushNotification,
  locationRequest,
}

@JsonSerializable(
  explicitToJson: true,
)
class FcmResponseModel extends BaseModel<FcmResponseModel> {
  String? to;
  Data? data;
  Android? android;
  Ios? ios;

  FcmResponseModel({
    this.to,
    this.data,
    this.android,
    this.ios,
  });

  @override
  fromJson(Map<String, dynamic> json) => FcmResponseModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$FcmResponseModelToJson(this);
  }

  factory FcmResponseModel.fromJson(Map<String, dynamic> json) {
    return _$FcmResponseModelFromJson(json);
  }
}

@JsonSerializable()
class Data extends BaseModel<Data> {
  FcmType? fcmType;
  String? title;
  String? message;

  Data({this.fcmType, this.title, this.message});

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

@JsonSerializable()
class Android extends BaseModel<Android> {
  String? priority;

  Android({this.priority});

  @override
  Android fromJson(Map<String, dynamic> json) => Android.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$AndroidToJson(this);
  }

  factory Android.fromJson(Map<String, dynamic> json) {
    return _$AndroidFromJson(json);
  }
}

@JsonSerializable()
class Ios extends BaseModel<Ios> {
  String? contentAvailable;

  Ios({this.contentAvailable});

  @override
  Ios fromJson(Map<String, dynamic> json) => Ios.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$IosToJson(this);
  }

  factory Ios.fromJson(Map<String, dynamic> json) {
    return _$IosFromJson(json);
  }
}

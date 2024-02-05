import 'package:json_annotation/json_annotation.dart';
import '../../base/model/base_model.dart';

part 'log_response_model.g.dart';

@JsonSerializable()
class LogResponseModel extends BaseModel<LogResponseModel> {
  final int? id;
  final DateTime? date;
  final String? thread;
  final String? level;
  final String? logger;
  final String? message;
  final String? exception;
  final int? platform;

  LogResponseModel({
    this.id,
    this.date,
    this.thread,
    this.level,
    this.logger,
    this.message,
    this.exception,
    this.platform,
  });

  @override
  fromJson(Map<String, dynamic> json) => LogResponseModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$LogResponseModelToJson(this);
  }

  factory LogResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LogResponseModelFromJson(json);
  }
}

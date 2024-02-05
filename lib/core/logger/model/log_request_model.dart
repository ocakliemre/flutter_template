import 'package:json_annotation/json_annotation.dart';
import '../../base/model/base_model.dart';
import '../log_enums.dart';

part 'log_request_model.g.dart';

@JsonSerializable()
class LogRequestModel extends BaseModel<LogRequestModel> {
  int? id;
  DateTime? date;
  LogPlatform? platform;
  String? logger;
  String? thread;
  LogLevel? level;
  String? message;
  String? exception;

  LogRequestModel({
    this.id,
    this.date,
    this.platform,
    this.thread,
    this.level,
    this.logger,
    required this.message,
    this.exception,
  }) {
    id ?? (id = 0);
    date ?? (date = DateTime.now());
    platform ?? (platform = LogPlatform.other.logPlatform);
    logger ?? (logger = '');
    thread ?? (thread = '0');
    level ?? (level = LogLevel.info);
    thread ?? (thread = '');
    exception ?? (exception = '');
    message ?? (message = '');
  }

  @override
  fromJson(Map<String, dynamic> json) => LogRequestModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$LogRequestModelToJson(this);
  }

  factory LogRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LogRequestModelFromJson(json);
  }
}

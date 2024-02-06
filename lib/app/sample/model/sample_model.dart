import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';
import '../../../core/cache/hive/constants/hive_constants.dart';

part 'sample_model.g.dart';

@HiveType(typeId: HiveConstants.sampleModelId)
@JsonSerializable()
class SampleModel extends BaseModel<SampleModel> {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;

  SampleModel({this.id, this.title});

  @override
  fromJson(Map<String, dynamic> json) => SampleModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$SampleModelToJson(this);
  }

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return _$SampleModelFromJson(json);
  }
}

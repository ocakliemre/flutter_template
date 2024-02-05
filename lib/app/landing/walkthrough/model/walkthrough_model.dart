import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

@JsonSerializable()
class WalkthroughModel extends BaseModel<WalkthroughModel> {
  int? id;
  String? title;
  String? description;
  String? image;

  WalkthroughModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  @override
  WalkthroughModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    throw UnimplementedError();
  }
}

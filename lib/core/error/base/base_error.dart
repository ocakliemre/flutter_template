import '../interface/IErrorModel.dart';

class ErrorModel implements IErrorModel {
  ErrorModel({this.description, this.model, this.statusCode});

  @override
  toString() {
    return description ?? '';
  }

  @override
  String? description;

  @override
  dynamic model;

  @override
  int? statusCode;
}

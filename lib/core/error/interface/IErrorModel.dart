// ignore_for_file: file_names

abstract class IErrorModel<T> {
  int? statusCode;
  String? description;
  T? model;
}

import '../../error/interface/IErrorModel.dart';
import '../interface/IResponseModel.dart';

class ResponseModel<T> implements IResponseModel<T> {
  @override
  T? data;

  @override
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}

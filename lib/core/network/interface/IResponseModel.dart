import '../../error/interface/IErrorModel.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}



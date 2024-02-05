import '../../base/model/base_model.dart';
import '../../enums/network_enums.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<T extends BaseModel, R>(
    String path, {
    required RequestType requestType,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
    bool showSnackMessages,
    bool enableErrorLog,
  });
}

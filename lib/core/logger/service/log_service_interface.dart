import '../model/log_request_model.dart';

abstract class ILogService {
  Future<bool> sendLog(LogRequestModel logRequestModel);
}

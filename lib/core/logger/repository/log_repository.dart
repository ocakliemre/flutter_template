import '../../enums/app_enums.dart';
import '../../init/constants/app_constants.dart';
import '../model/log_request_model.dart';
import '../service/log_mock_service.dart';
import '../service/log_service.dart';
import '../service/log_service_interface.dart';

class LogRepository extends ILogService {
  late final LogService _logService;
  late final LogMockService _logMockService;

  LogRepository() {
    _logService = LogService();
    _logMockService = LogMockService();
  }

  @override
  Future<bool> sendLog(LogRequestModel logRequestModel) async {
    if (AppConstants.appMode == AppMode.release) {
      return await _logService.sendLog(logRequestModel);
    } else {
      return await _logMockService.sendLog(logRequestModel);
    }
  }
}

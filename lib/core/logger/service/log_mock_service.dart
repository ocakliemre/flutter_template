import '../log_enums.dart';
import '../model/log_request_model.dart';
import 'log_service_interface.dart';

class LogMockService extends ILogService {
  static final LogRequestModel mockLogRequestModel = LogRequestModel(
    date: DateTime.tryParse('2022-12-08T14:08:59.296274'),
    level: LogLevel.error,
    message: 'Test hatası.',
    exception: '',
    logger: '',
    thread: '',
  );

  @override
  Future<bool> sendLog(LogRequestModel logRequestModel) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}

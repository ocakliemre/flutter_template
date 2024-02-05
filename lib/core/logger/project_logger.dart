part of 'logger_mixin.dart';

class _ProjectLogger extends ILogService {
  late final LogRepository _logRepository;

  static _ProjectLogger? _instance;
  static _ProjectLogger get instance {
    _instance ??= _ProjectLogger._init();
    return _instance!;
  }

  _ProjectLogger._init() {
    _logRepository = LogRepository();
  }

  void logClassName<T>(T page) {
    //log(page.toString());
    //debugPrint('$page');
  }

  @override
  Future<bool> sendLog(LogRequestModel logRequestModel) async {
    bool serviceResult = await _logRepository.sendLog(
      logRequestModel,
    );
    debugPrint(
        '${serviceResult ? 'Log sended' : 'Failed to send log.'} : (${logRequestModel.toJson()})');

    return serviceResult;
  }
}

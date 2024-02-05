import 'package:dio/dio.dart';
import '../init/constants/service_constants.dart';
import 'interface/ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ServiceConstants.baseUrl,
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json-patch+json",
        "Access-Control-Allow-Origin": "*",
      },
      connectTimeout: ServiceConstants.serviceTimeout,
      receiveTimeout: ServiceConstants.serviceTimeout,
      sendTimeout: ServiceConstants.serviceTimeout,
      validateStatus: (status) => true,
    );

    coreDio = CoreDio(baseOptions);
  }
}

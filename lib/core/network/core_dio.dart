import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/extensions/network_extension.dart';
import '../../locator.dart';
import '../auth_manager/viewmodel/authentication_viewmodel.dart';
import '../base/model/base_model.dart';
import '../enums/network_enums.dart';
import '../error/base/base_error.dart';
import '../error/extension/exception_extension.dart';
import '../logger/log_enums.dart';
import '../logger/logger_mixin.dart';
import '../logger/model/log_request_model.dart';
import 'interface/ICoreDio.dart';

// ignore: implementation_imports
import 'package:dio/src/adapters/io_adapter.dart'
    if (dart.library.html) 'package:dio/src/adapters/browser_adapter.dart'
    as adapter;

import 'interface/IResponseModel.dart';
import 'model/response_model.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin, LoggerMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  final AuthenticationViewModel _authenticationViewModel =
      locator<AuthenticationViewModel>();

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.response?.statusCode == HttpStatus.unauthorized) {
          // If a 401 response is received, refresh the access token
          _authenticationViewModel.signedUser?.token = await refreshToken();

          // Update the request header with the new access token
          // e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          // Repeat the request with the updated header
          return handler.resolve(await fetch(e.requestOptions));
        }
        return handler.next(e);
      },
      onResponse: (e, handler) {
        return handler.next(e);
      },
      onRequest: (options, handler) {
        // Add the access token to the request header
        options.headers['Authorization'] =
            _authenticationViewModel.signedUser?.token;

        return handler.next(options);
      },
    ));
    httpClientAdapter = adapter.createAdapter();
  }

  @override
  Future<IResponseModel<R>> send<T extends BaseModel, R>(
    String path, {
    required RequestType requestType,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
    bool showSnackMessages = true,
    bool enableErrorLog = true,
  }) async {
    try {
      final response = await request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(method: requestType.rawValue));
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          {
            final model = _responseParser<R, T>(parseModel, response.data);
            return ResponseModel<R>(data: model);
          }

        default:
          {
            if (enableErrorLog) {
              sendLog(LogRequestModel(
                level: LogLevel.error,
                exception:
                    'Http Error: ${response.statusCode} - ${response.statusMessage}',
                message: 'baseUrl: ${options.baseUrl} path: $path',
              ));
            }

            if (showSnackMessages) {
              ExceptionType.responseError.showSnack(
                  message:
                      '(${response.statusCode} - ${response.statusMessage})');
            }
            return ResponseModel(
              error: ErrorModel(
                statusCode: response.statusCode,
                description: response.statusMessage,
                model: response.data,
              ),
            );
          }
      }
    } on DioException catch (e) {
      if (showSnackMessages) {
        ExceptionType.connectionError.showSnack();
      }

      if (enableErrorLog) {
        sendLog(LogRequestModel(
          level: LogLevel.error,
          exception: e.message,
          message: 'baseUrl: ${options.baseUrl} path: $path',
        ));
      }

      return ResponseModel(
        error: ErrorModel(description: e.message),
      );
    }
  }

  Future<String> refreshToken() async {
    // Perform a request to the refresh token endpoint and return the new access token.
    // You can replace this with your own implementation.
    return 'your_new_access_token';
  }
}

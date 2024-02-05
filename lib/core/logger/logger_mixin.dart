import 'package:flutter/material.dart';
import 'model/log_request_model.dart';
import 'repository/log_repository.dart';
import 'service/log_service_interface.dart';
part 'project_logger.dart';

mixin LoggerViewMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    _ProjectLogger.instance.logClassName(
        this); //TODO: (Emre) Burada Statefuldan türeyen tüm sınıfların initstate metotları çalıştığında sınıf adını loga gönderen işlem yapılıyor. Örnek olarak yapıldı. Sonradan kaldırılacak.
  }
}

mixin LoggerMixin {
  Future<bool> sendLog(LogRequestModel logRequestModel) async {
    return await _ProjectLogger.instance.sendLog(logRequestModel);
  }
}

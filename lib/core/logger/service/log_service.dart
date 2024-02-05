import '../../../app/auth/login/model/login_response_model.dart';
import '../../enums/network_enums.dart';
import '../../error/base/base_error.dart';
import '../../init/constants/service_constants.dart';
import '../../network/network_manager.dart';
import '../../utility/service_helper.dart';
import '../model/log_request_model.dart';
import 'log_service_interface.dart';

class LogService extends ILogService with ServiceHelper {
  @override
  Future<bool> sendLog(LogRequestModel logRequestModel) async {
    final response = await NetworkManager.instance?.coreDio?.send(
      ServiceConstants.systemLogAdd,
      requestType: RequestType.post,
      parseModel: LoginResponseModel(),
      data: logRequestModel,
      enableErrorLog: false,
      showSnackMessages: false,
    );

    if (response?.error is ErrorModel) {
      return false;
    } else {
      return true;
    }
  }
}

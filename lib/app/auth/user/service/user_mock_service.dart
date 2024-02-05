import '../../../../app/auth/user/model/user_response_model.dart';
import '../../../../app/auth/user/service/user_service_interface.dart';
import '../../../../core/logger/model/log_request_model.dart';
import '../../../../core/logger/repository/log_repository.dart';

class UserMockService extends IUserService {
  @override
  Future<UserResponseModel?> getUserById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserFcmId(
      {required int userId, required String fcmId}) async {
    LogRepository logRepository = LogRepository();
    await logRepository.sendLog(LogRequestModel(
        message: '(updateUserFcmId): userId:$userId :  FcmId $fcmId'));
  }
}

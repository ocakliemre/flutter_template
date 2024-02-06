import '../../../../app/auth/user/model/user_response_model.dart';
import '../../../../app/auth/user/service/user_mock_service.dart';
import '../../../../app/auth/user/service/user_service.dart';
import '../../../../app/auth/user/service/user_service_interface.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/init/constants/app_constants.dart';

class UserRepository extends IUserService {
  late final UserService _userService;
  late final UserMockService _userMockService;

  UserRepository() {
    _userService = UserService();
    _userMockService = UserMockService();
  }

  @override
  Future<UserResponseModel?> getUserById(int id) async {
    if (AppConstants.appMode == AppMode.release) {
      return await _userService.getUserById(id);
    } else {
      return await _userMockService.getUserById(id);
    }
  }

  @override
  Future<void> updateUserFcmId({required int userId, required String fcmId}) async {
    if (AppConstants.appMode == AppMode.release) {
      return await _userService.updateUserFcmId(userId: userId, fcmId:fcmId);
    } else {
      return await _userMockService.updateUserFcmId(userId: userId, fcmId:fcmId);
    }
  }
}

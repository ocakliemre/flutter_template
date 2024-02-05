import '../../../../app/auth/user/model/user_response_model.dart';
import '../../../../app/auth/user/service/user_service_interface.dart';
import '../../../../core/error/base/base_error.dart';
import '../../../../core/enums/network_enums.dart';
import '../../../../core/init/constants/service_constants.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../core/utility/service_helper.dart';

class UserService extends IUserService with ServiceHelper {
  @override
  Future<UserResponseModel?> getUserById(int id) async {
    final response = await NetworkManager.instance?.coreDio?.send(
        ServiceConstants.userGetUserById,
        requestType: RequestType.get,
        parseModel: UserResponseModel(),
        queryParameters: {'id': id});

    if (response?.data is UserResponseModel) {
      return response?.data;
    } else if (response?.error is ErrorModel) {
      throw response?.error as ErrorModel;
    }
    return null;
  }

  @override
  Future<void> updateUserFcmId({required int userId, required String fcmId}) {
    throw UnimplementedError();
  }
}

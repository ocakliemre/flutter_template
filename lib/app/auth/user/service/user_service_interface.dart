
import '../model/user_response_model.dart';

abstract class IUserService {
  Future<UserResponseModel?> getUserById(int id);
  Future<void> updateUserFcmId({required int userId, required String fcmId});
}

import '../../../../app/auth/login/model/login_request_model.dart';
import '../../../../app/auth/login/model/login_response_model.dart';
import '../../../../core/auth_manager/model/user_model.dart';

abstract class ILoginService {
  Future<LoginResponseModel?> signIn(LoginRequestModel loginRequestModel);
  Future<void> saveUser(UserModel userModel);
  Future<UserModel?> getUser();
  Future<void> clearUser();
  Future<void> saveUserAndPasswordToDevice(LoginRequestModel loginRequestModel);
  Future<void> deleteUserAndPasswordFromDevice();
  Future<LoginRequestModel?> getUserAndPasswordFromDevice();
}

import '../../../../app/auth/login/model/login_request_model.dart';
import '../../../../app/auth/login/model/login_response_model.dart';
import '../../../../core/auth_manager/model/user_model.dart';
import '../../../../core/error/base/base_error.dart';
import '../../../../core/enums/network_enums.dart';
import '../../../../core/init/constants/service_constants.dart';
import '../../../../core/network/network_manager.dart';
import '../../../../core/utility/service_helper.dart';
import '../../../../app/auth/login/service/login_service_interface.dart';

class LoginService extends ILoginService with ServiceHelper {
  @override
  Future<LoginResponseModel?> signIn(
      LoginRequestModel loginRequestModel) async {
    final response = await NetworkManager.instance?.coreDio?.send(
      ServiceConstants.authLogin,
      requestType: RequestType.post,
      parseModel: LoginResponseModel(),
      data: loginRequestModel,
    );

    if (response?.data is LoginResponseModel) {
      return response?.data;
    } else if (response?.error is ErrorModel) {
      throw response?.error as ErrorModel;
    }
    return null;
  }

  @override
  Future<void> clearUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserAndPasswordFromDevice() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<LoginRequestModel?> getUserAndPasswordFromDevice() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserAndPasswordToDevice(
      LoginRequestModel loginRequestModel) {
    throw UnimplementedError();
  }
}

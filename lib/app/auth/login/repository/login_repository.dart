// ignore_for_file: dead_code
import '../../../../app/auth/login/cache/login_cache_manager.dart';
import '../../../../app/auth/login/model/login_request_model.dart';
import '../../../../app/auth/login/model/login_response_model.dart';
import '../../../../app/auth/login/service/login_mock_service.dart';
import '../../../../app/auth/login/service/login_service.dart';
import '../../../../app/auth/login/service/login_service_interface.dart';
import '../../../../core/auth_manager/cache/user_cache_manager.dart';
import '../../../../core/auth_manager/model/user_model.dart';
import '../../../../core/cache/hive/constants/hive_constants.dart';
import '../../../../core/cache/hive/interface/ICacheManager.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/init/constants/app_constants.dart';

class LoginRepository implements ILoginService {
  //Service
  late final LoginService _loginService;
  late final LoginMockService _loginMockService;

  //Cache
  late final ICacheManager<LoginRequestModel> _loginCacheManager;
  late final ICacheManager<UserModel> _userCacheManager;

  LoginRepository() {
    _loginService = LoginService();
    _loginMockService = LoginMockService();

    _loginCacheManager = LoginCacheManager(HiveConstants.loginRequestModelKey);

    _userCacheManager = UserCacheManager(HiveConstants.userModelKey);
  }

  @override
  Future<LoginResponseModel?> signIn(
      LoginRequestModel loginRequestModel) async {
    if (AppConstants.appMode == AppMode.release) {
      return await _loginService.signIn(loginRequestModel);
    } else {
      return await _loginMockService.signIn(loginRequestModel);
    }
  }

  @override
  Future<void> deleteUserAndPasswordFromDevice() async {
    _loginCacheManager.clearAll();
  }

  @override
  Future<void> saveUserAndPasswordToDevice(
      LoginRequestModel loginRequestModel) async {
    await _loginCacheManager.putItem(
        HiveConstants.loginRequestModelKey, loginRequestModel);
  }

  @override
  Future<LoginRequestModel?> getUserAndPasswordFromDevice() async {
    return await _loginCacheManager
        .getValue(HiveConstants.loginRequestModelKey);
  }

  @override
  Future<UserModel?> getUser() async {
    return await _userCacheManager.getValue(HiveConstants.userModelKey);
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    await _userCacheManager.putItem(HiveConstants.userModelKey, userModel);
  }

  @override
  Future<void> clearUser() async {
    await _userCacheManager.clearAll();
  }
}

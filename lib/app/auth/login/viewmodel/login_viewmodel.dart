import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/app_manager/model/settings_model.dart';
import '../../../../core/app_manager/viewmodel/app_manager_viewmodel.dart';
import '../../../../core/auth_manager/model/user_model.dart';
import '../../../../core/auth_manager/viewmodel/authentication_viewmodel.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import '../../../../core/error/base/base_error.dart';
import '../../../../core/firebase_services/firebase_messaging/firebase_messaging_manager.dart';
import '../../../../locator.dart';
import '../../user/viewmodel/user_viewmodel.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import '../repository/login_repository.dart';
import '../service/login_service_interface.dart';

class LoginViewModel extends BaseViewModel implements ILoginService {
  late final LoginRepository _loginRepository;
  late final UserViewModel _userViewModel;
  bool _rememberMe = false;
  bool _hidePassword = true;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  LoginViewModel() {
    _loginRepository = LoginRepository();
    getUserAndPasswordFromDevice();
    _userViewModel = locator<UserViewModel>();
  }

  @override
  FutureOr<void> init() {}

  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe = value;
    if (!_rememberMe) {
      deleteUserAndPasswordFromDevice();
    }
    notifyListeners();
  }

  bool get hidePassword => _hidePassword;

  set hidePassword(bool value) {
    _hidePassword = value;
    notifyListeners();
  }

  @override
  Future<LoginResponseModel?> signIn(
      LoginRequestModel loginRequestModel) async {
    LoginResponseModel? response = LoginResponseModel();
    AuthenticationViewModel authenticationViewModel =
        locator<AuthenticationViewModel>();

    try {
      viewState = ViewState.loading;
      response = await _loginRepository.signIn(loginRequestModel);

      if (response?.success ?? false) {
        UserModel userModel = UserModel.fromLoginResponseModel(response);

        ///User servisinden login olan kullanıcı bilgilerinin alınması.
        ///
        userModel.user =
            await _userViewModel.getUserById(response?.data?.userId);

        ///Firebase Messaging işlemlerinin başlatılması ve User servisine Firebase Messaging Id'sinin gönderilmesi.
        ///
        if (userModel.user?.userID != null) {
          FirebaseMassagingManager.instance.initializeFcm().then((fcmId) {
            _userViewModel.updateUserFcmId(
                userId: userModel.user!.userID!, fcmId: fcmId ?? '');
          });
        }

        ///Beni Hatırla.
        ///
        rememberMeAction(
          rememberMe: rememberMe,
          loginRequestModel: loginRequestModel,
        );

        ///Kullanıcı bilgilerinin cihaza kaydedilmesi.
        ///
        await saveUser(userModel);

        ///Kaydedilen kullanıcının yeniden cihazdan okunarak AuthenticationManager üzerindeki bilgilerin doldurulması.
        ///
        await authenticationViewModel.getSignedUser();

        final asd = await getUser();
        debugPrint(asd?.userName);
      }

      viewState = ViewState.loaded;
    } catch (e) {
      viewState = ViewState.error;
      if (e is ErrorModel) {
        response?.success = false;
        response?.message = e.description;
      }
    }
    return response;
  }

  //Beni Hatırla seçeneği işlemleri.
  void rememberMeAction(
      {required bool rememberMe,
      required LoginRequestModel loginRequestModel}) {
    if (rememberMe) {
      saveUserAndPasswordToDevice(loginRequestModel)
          .then((value) => getUserAndPasswordFromDevice());
    } else {
      deleteUserAndPasswordFromDevice()
          .then((value) => getUserAndPasswordFromDevice());
    }
  }

  @override
  Future<void> deleteUserAndPasswordFromDevice() async {
    viewState = ViewState.loading;
    await _loginRepository.deleteUserAndPasswordFromDevice();
    viewState = ViewState.loaded;
  }

  @override
  Future<void> saveUserAndPasswordToDevice(
      LoginRequestModel loginRequestModel) async {
    viewState = ViewState.loading;
    await _loginRepository.saveUserAndPasswordToDevice(loginRequestModel);
    await getUserAndPasswordFromDevice();
    viewState = ViewState.loaded;
  }

  @override
  Future<LoginRequestModel?> getUserAndPasswordFromDevice() async {
    final result = await _loginRepository.getUserAndPasswordFromDevice();
    rememberMe = result?.userName == '' ? false : true;
    userNameController.text = result?.userName ?? '';
    passwordController.text = result?.password ?? '';

    return result;
  }

  @override
  Future<UserModel?> getUser() async {
    final result = await _loginRepository.getUser();
    return result;
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    await _loginRepository.saveUser(userModel);
  }

  Future<bool> checkServerParams() async {
    SettingsModel? settingsModel =
        await locator<AppManagerViewModel>().getSettingsFromDevice();

    if (settingsModel?.ip != null && settingsModel?.port != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> clearUser() async {
    await _loginRepository.clearUser();
  }

  @override
  void clearFilter() {}

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {}
}

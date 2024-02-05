import 'dart:async';
import 'package:flutter/material.dart';
import '../../../app/auth/login/viewmodel/login_viewmodel.dart';
import '../../../locator.dart';
import '../../base/viewmodel/base_viewmodel.dart';
import '../../init/constants/app_constants.dart';
import '../model/user_model.dart';

class AuthenticationViewModel extends BaseViewModel {
  bool _isAuthenticated = false;
  UserModel? _signedUser;

  AuthenticationViewModel() {
    //  fetchUserLogin();
  }

  UserModel? get signedUser => _signedUser;

  set signedUser(UserModel? value) {
    _signedUser = value;
    notifyListeners();
  }

  bool get isAuthenticated {
    checkExpiration(_signedUser);
    return _isAuthenticated;
  }

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    if (_isAuthenticated == false) {
      removeAllData();
    }
    notifyListeners();
  }

  Future<void> removeAllData() async {
    await locator<LoginViewModel>().clearUser();
    _isAuthenticated = false;
    _signedUser = null;
  }

  Future<UserModel?> getSignedUser() async {
    final result = await locator<LoginViewModel>().getUser();
    if (result != null) {
      if (checkExpiration(result)) {
        _signedUser = result;
      }
    }
    return _signedUser;
  }

  ///Kullanıcı oturumunun süresini ve durumunu kontrol eder.
  ///
  bool checkExpiration(UserModel? userModel) {
    DateTime currentTime = DateTime.now();
    if (userModel != null) {
      if ((userModel.expiration ?? currentTime).isAfter(currentTime)) {
        _isAuthenticated = true;
        return true;
      }
    }
    _isAuthenticated = false;
    return false;
  }

  /// Oturumun bitmesine kadar kalan süreyi verir.
  ///
  Future<Duration> getRemainingTime(UserModel? userModel) async {
    DateTime currentTime = DateTime.now();

    Duration remainingTime;
    if (userModel != null) {
      remainingTime =
          userModel.expiration?.difference(currentTime) ?? Duration.zero;
    } else {
      remainingTime = Duration.zero;
    }

    return remainingTime;
  }

  ///Oturum süresini uzatır.
  ///
  Future<void> extendSessionDuration() async {
    _signedUser?.expiration =
        _signedUser?.expiration?.add(AppConstants.sessionExtendDuration);
  }

  @override
  FutureOr<void> init() {}

  @override
  void clearFilter() {}

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {}
}

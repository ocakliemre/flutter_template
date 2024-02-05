import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../app/auth/user/model/user_response_model.dart';
import '../../../../app/auth/user/repository/user_repository.dart';
import '../../../../app/auth/user/service/user_service_interface.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';

class UserViewModel extends BaseViewModel implements IUserService {
  late final UserRepository _userRepository;
  UserResponseModel? userResponseModel;

  UserViewModel() {
    _userRepository = UserRepository();
  }

  @override
  FutureOr<void> init() {}

  @override
  Future<UserResponseModel?> getUserById(int? id) async {
    UserResponseModel? response = UserResponseModel();
    try {
      viewState = ViewState.loading;
      response = await _userRepository.getUserById(id ?? 0);
      viewState = ViewState.loaded;
    } catch (e) {
      viewState = ViewState.error;
    }

    return response;
  }

  @override
  void clearFilter() {}

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {}

  @override
  Future<void> updateUserFcmId(
      {required int userId, required String fcmId}) async {
    return await _userRepository.updateUserFcmId(userId: userId, fcmId: fcmId);
  }
}

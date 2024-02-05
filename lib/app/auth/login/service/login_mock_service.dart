import '../../../../app/auth/login/model/login_request_model.dart';
import '../../../../app/auth/login/model/login_response_model.dart';
import '../../../../app/auth/login/service/login_service_interface.dart';
import '../../../../core/auth_manager/model/user_model.dart';

class LoginMockService extends ILoginService {
  final LoginResponseModel _mockSampleModel = LoginResponseModel(
    message: 'Success Login',
    visible: false,
    success: true,
    data: Data(
        claims: [
          "1",
          "16",
          "17",
          "21",
          "22",
          "23",
          "24",
          "25",
        ],
        expiration:
            '2023-11-27 13:38:00.118962', //'2023-11-20T16:31:17.0528103+03:00',
        refreshToken:
            'Mh1hueLrIU+zzmGJsdr4q0BuPWUT04yfOZ5G/v2QU8h0aswuAuT9VCRVBny9wyuFDkSAccbxlAWdaF8WSZgr3w==',
        token:
            'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE2NSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJlbXJlLm9jYWtsaSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyIxIiwiMTYiLCIxNyIsIjIxIiwiMjIiLCIyMyIsIjI0IiwiMjUiLCIyNiIsIjI3IiwiMjgiLCIyOSIsIjMwIiwiMzEiLCIzMiIsIjMzIiwiMzQiLCIzNSIsIjM2IiwiMzciLCIzOCIsIjM5IiwiNDAiLCI0MSIsIjQyIiwiNDMiLCI0NCIsIjQ1IiwiNDYiLCI0NyIsIjQ4IiwiNDkiLCI1MCIsIjUxIiwiNTIiLCI1MyIsIjU0IiwiNTUiLCI1NiIsIjU3IiwiNTgiLCI1OSIsIjYwIiwiNjQiLCI2NSIsIjcwIiwiNzEiLCI3MyIsIjc2IiwiNzciLCI3OSIsIjgxIiwiODIiLCI4MyIsIjg0IiwiODUiLCI4NiIsIjg3IiwiODgiLCI4OSIsIjkwIiwiMTE3IiwiMTE4IiwiMTE5IiwiMTI0IiwiMTI2IiwiMTI4IiwiMTMwIiwiMTMyIiwiMTMzIiwiMTM0IiwiMTM1IiwiMTM2IiwiMTM3IiwiMTM4IiwiMTM5IiwiMTQwIiwiMTQxIiwiMTQyIiwiMTQzIiwiMTQ0IiwiMTQ1IiwiMTQ2IiwiMTQ3IiwiMTQ4IiwiMTQ5IiwiMTU1IiwiMTU2IiwiMTU3IiwiMTU4IiwiMTU5IiwiMTYzIiwiMTY0IiwiMTY2IiwiMTY4IiwiMTcxIiwiMTc0IiwiMTc3IiwiMTgwIiwiMTg4IiwiMTE5NSJdLCJuYmYiOjE2NzI5MDkzMzcsImV4cCI6MTY3MjkxMDUzNywiaXNzIjoid3d3LmF1emVmLmNvbSIsImF1ZCI6Ind3dy5hdXplZi5jb20ifQ.3u7aPR1fIBHdQFEjHLxLSPSd6BfPe9F0aKFjxFZ0uZM'),
  );

  @override
  Future<LoginResponseModel> signIn(LoginRequestModel loginRequestModel) async {
    await Future.delayed(const Duration(seconds: 2));
    _mockSampleModel.data?.expiration =
        DateTime.now().add(const Duration(seconds: 130)).toLocal().toString();

    return _mockSampleModel;
  }

  @override
  Future<void> deleteUserAndPasswordFromDevice() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserAndPasswordToDevice(
      LoginRequestModel loginRequestModel) {
    throw UnimplementedError();
  }

  @override
  Future<LoginRequestModel> getUserAndPasswordFromDevice() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(UserModel? userModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> clearUser() {
    throw UnimplementedError();
  }
}

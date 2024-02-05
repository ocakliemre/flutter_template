import 'package:hive_flutter/hive_flutter.dart';
import '../../../app/auth/user/model/user_response_model.dart';
import '../../cache/hive/constants/hive_constants.dart';
import '../../cache/hive/interface/ICacheManager.dart';
import '../model/user_model.dart';


class UserCacheManager extends ICacheManager<UserModel> {
  UserCacheManager(super.key);

  @override
  Future<void> putItems(List<UserModel> items) {
    throw UnimplementedError();
  }

  @override
  void registerAdapters() {
    if ((!Hive.isAdapterRegistered(HiveConstants.userModelId)) ||
        (!Hive.isAdapterRegistered(HiveConstants.userResponseModelId))) {
      Hive.registerAdapter(UserModelAdapter());
      Hive.registerAdapter(UserResponseModelAdapter());
    }
  }
}

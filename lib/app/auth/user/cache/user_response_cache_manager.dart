import 'package:hive_flutter/hive_flutter.dart';
import '../../../../app/auth/user/model/user_response_model.dart';
import '../../../../core/cache/hive/constants/hive_constants.dart';
import '../../../../core/cache/hive/interface/ICacheManager.dart';

class UserResponseCacheManager extends ICacheManager<UserResponseModel> {
  UserResponseCacheManager(super.key);

  @override
  Future<void> putItems(List<UserResponseModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.userID, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.userResponseModelId)) {
      Hive.registerAdapter(UserResponseModelAdapter());
    }
  }
}

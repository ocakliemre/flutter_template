import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/cache/hive/constants/hive_constants.dart';
import '../../../../core/cache/hive/interface/ICacheManager.dart';
import '../model/login_request_model.dart';

class LoginCacheManager extends ICacheManager<LoginRequestModel> {
  LoginCacheManager(super.key);

  @override
  Future<void> putItems(List<LoginRequestModel> items) async {
    await init();
    await box
        ?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.userName, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.loginRequestModelId)) {
      Hive.registerAdapter(LoginRequestModelAdapter());
    }
  }
}

import 'package:flutter_template/app/sample/model/sample_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/cache/hive/constants/hive_constants.dart';
import '../../../core/cache/hive/interface/ICacheManager.dart';

class SampleCacheManager extends ICacheManager<SampleModel> {
  SampleCacheManager(super.key);

  @override
  Future<void> putItems(List<SampleModel> items) async {
    await init();
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.sampleModelId)) {
      Hive.registerAdapter(SampleModelModelAdapter());
    }
  }
}

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../logger/logger_mixin.dart';
import '../../../logger/model/log_request_model.dart';

abstract class ICacheManager<T> with LoggerMixin {
  final String key;
  Box<T>? box;

  ICacheManager(this.key);
  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      final secretKey = base64Url.decode((await getSecretKey())!);
      box = await Hive.openBox(
        key,
        encryptionCipher: HiveAesCipher(secretKey),
      );
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    try {
      await init();
      await box?.clear();
    } catch (e) {
      sendErrorLog(e.toString());
    }
  }

  Future<void> addItems(List<T> items) async {
    try {
      await init();
      await box?.addAll(items);
    } catch (e) {
      sendErrorLog(e.toString());
    }
  }

  Future<void> putItems(List<T> items);

  Future<T?> getValue(String key) async {
    try {
      await init();
      return box?.get(key);
    } catch (e) {
      sendErrorLog(e.toString());
    }
    return null;
  }

  Future<List<T>?> getValues() async {
    try {
      await init();
      return box?.values.toList();
    } catch (e) {
      sendErrorLog(e.toString());
    }
    return null;
  }

  Future<void> putItem(String key, T item) async {
    try {
      await init();
      await box?.put(key, item);
    } catch (e) {
      sendErrorLog(e.toString());
    }
  }

  Future<void> removeItem(String key) async {
    try {
      await init();
      await box?.delete(key);
    } catch (e) {
      sendErrorLog(e.toString());
    }
  }

  /// Hive encrypted box için kullanacağımız şifreleme anahtarını Flutter Secure Storage üzerinde saklıyoeuz.
  /// Daha önceden şifreleme anahtarı oluşturulmuşsa onu çağırıyoruz. Eğer yoksa yeni oluşturup cihaz üzerine kaydediyoruz.
  /// Uygulama verileri silinene dek cihaza özel aynı şifreleme anahtarı kullanılmaktadır.
  Future<String?> getSecretKey() async {
    const secureStorage = FlutterSecureStorage();
    const secretKeyName = 'secretKey';

    String? secretKeyValue = await secureStorage.read(key: secretKeyName);
    if (secretKeyValue == null) {
      secretKeyValue = base64UrlEncode(Hive.generateSecureKey());
      await secureStorage.write(key: secretKeyName, value: secretKeyValue);
    }

    return await secureStorage.read(key: secretKeyName);
  }

  void sendErrorLog(String errorMessage) {
    sendLog(LogRequestModel(message: errorMessage));
  }
}

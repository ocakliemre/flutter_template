import 'package:firebase_messaging/firebase_messaging.dart';
import '../../logger/logger_mixin.dart';
import 'model/fcm_response_model.dart';

class FirebaseMassagingManager with LoggerMixin {
  static final FirebaseMassagingManager _instance =
      FirebaseMassagingManager._init();
  static FirebaseMassagingManager get instance => _instance;
  FirebaseMassagingManager._init();

  Future<String?> initializeFcm() async {
    FirebaseMessaging fcm = FirebaseMessaging.instance;
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    final String? fcmToken = await fcm.getToken();
    //debugPrint('Fcm Token: $fcmToken');
    //fcm.requestPermission().then((value) => debugPrint(value.authorizationStatus.toString()));

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await _firebaseMessagingForegroundHandler(message);
    });

    return fcmToken;
  }
}

Future<void> _firebaseMessagingForegroundHandler(RemoteMessage message) async {
  FcmResponseModel fcmResponseModel =
      FcmResponseModel.fromJson(message.toMap());

  if (fcmResponseModel.data?.fcmType == FcmType.locationRequest) {
    sendMyLocation(fcmResponseModel);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  FcmResponseModel fcmResponseModel =
      FcmResponseModel.fromJson(message.toMap());

  if (fcmResponseModel.data?.fcmType == FcmType.locationRequest) {
    sendMyLocation(fcmResponseModel);
  }
}

Future<void> sendMyLocation(FcmResponseModel fcmResponseModel) async {}

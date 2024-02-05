import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import '../logger/logger_mixin.dart';
import '../utility/view_helper.dart';
import '../widgets/custom_dialog_widget.dart';

class PermissionManager with LoggerMixin, ViewHelper {
  static final PermissionManager _instance = PermissionManager._init();

  static PermissionManager get instance => _instance;

  PermissionManager._init();

  Future<void> checkPermissions() async {
    Map<Permission, PermissionStatus> permissionStatus = await [
      Permission.notification,
      Permission.storage,
      Permission.locationWhenInUse,
    ].request();

    await checkLocationPermissions();
  }

  Future<bool> checkLocationPermissions() async {
    if (await Permission.locationAlways.isGranted) {
      return await locationServicesStatus();
    } else {
      if (await Permission.locationWhenInUse.request().isGranted) {
        await showCustomDialog(
            dialogTitleType: AlertDialogTitleType.alert,
            description:
                'Uygulamanın doğru çalışması için konum erişimine "Her zaman izin ver" seçeneğini işaretleyiniz.');

        await Permission.locationAlways.request().then((locationAlways) async {
          if (!locationAlways.isGranted) {
            await showCustomDialog(
                dialogTitleType: AlertDialogTitleType.alert,
                description:
                    'Tüm izinlere onay vermediğiniz için uygulamanız doğru çalışmayacaktır. Ayarlar bölümünden uygulama izinlerini güncelleyebilirsiniz.');
          }
        });
      }

      return false;
    }
  }

  Future<bool> locationServicesStatus({bool isBackground = false}) async {
    return false;
  }
}

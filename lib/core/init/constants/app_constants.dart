import '../../enums/app_enums.dart';

class AppConstants {
  ///App
  static const appName = "Printflow";
  static const packageName = "com.ptt.deliverytracking";
  static const localizationAssetPath = "assets/translations";

  static AppPlatform appPlatform = AppPlatform.other.appPlatform;
  static AppMode appMode = AppMode.release;

  ///Durations
  static const splashDuration = Duration(seconds: 0);
  static const snackBarDurationShort = Duration(seconds: 1);
  static const snackBarDurationMid = Duration(seconds: 4);
  static const snackBarDurationLong = Duration(seconds: 5);

  ///Authentication
  static const sessionDuration = Duration(
      minutes:
          15); //Hareket olmadığında belirtilen süre sonunda oturum kapatılır.
  static const sessionExtendDuration = Duration(
      minutes: 15); //Oturum süresi uzatılmak istendiğinde verilecek ek süre.
  static const sessionExpiryDialogDuration =
      10; //Oturumun uzatma diyalog penceresine ait sayaç süresi.

  ///Filter
  static DateTime maxFilterDateLimit =
      DateTime.now().add(const Duration(days: 365 * 10));
  static DateTime minFilterDateLimit =
      DateTime.now().subtract(const Duration(days: 365 * 10));
}

import '../enums/network_enums.dart';

extension NetworkTypeExtension on RequestType? {
  String get rawValue {
    switch (this) {
      case RequestType.get:
        return 'GET';
      case RequestType.post:
        return 'POST';
      default:
        throw 'ERROR TYPE';
    }
  }
}
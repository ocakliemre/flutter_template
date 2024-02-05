import 'dart:convert';

class ImageHelper {
  static final ImageHelper constants = ImageHelper._();
  factory ImageHelper() => constants;
  ImageHelper._();

  dynamic base64toImage(String encoded) {
    String decoded = utf8.decode(base64Url.decode(encoded));
    return decoded;
  }
}

import '../../../core/extensions/string_extension.dart';
import '../../init/language/locale_keys.g.dart';
import '../../utility/view_helper.dart';
import '../base/base_error.dart';

enum ExceptionType {
  other,
  connectionError,
  responseError,
}

extension ExceptionExtension on ExceptionType {
  ErrorModel errorModelFromException({required String message}) {
    switch (this) {
      case ExceptionType.other:
        return ErrorModel(
            description:
                '${LocaleKeys.exception_otherLabelText.locale} $message');
      case ExceptionType.connectionError:
        return ErrorModel(
            description:
                '${LocaleKeys.exception_connectionErrorLabelText.locale} $message');
      case ExceptionType.responseError:
        return ErrorModel(
            description:
                '${LocaleKeys.exception_responseErrorLabelText.locale} $message');
      default:
        return ErrorModel(description: '');
    }
  }

  showSnack({String? message}) {
    ViewHelperClass viewHelper = ViewHelperClass();

    viewHelper.showSnackBarMessage(
        message: errorModelFromException(message: message ?? '').description);

    return true;
  }
}

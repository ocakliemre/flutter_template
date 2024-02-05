import '../../../core/extensions/string_extension.dart';
import '../init/language/locale_keys.g.dart';

enum Validate { checkEmpty, checkFormatPort }

extension ValidateEnum on Validate {
  Function(String?) get enumToFunc {
    switch (this) {
      case Validate.checkEmpty:
        return CustomFormFieldValidator()._checkEmpty;
      case Validate.checkFormatPort:
        return CustomFormFieldValidator()._checkFormatPort;
    }
  }
}

class CustomFormFieldValidator {
  final List<Validate>? validateList;

  CustomFormFieldValidator({this.validateList});

  String? checkValidations(String? value) {
    for (var element in validateList!) {
      var result = element.enumToFunc(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  String? _checkEmpty(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return LocaleKeys.formValidation_notEmpty.locale;
    } else {
      return null;
    }
  }

  String? _checkFormatPort(String? value) {
    final regExp = RegExp(r'^[0-9]+$');
    if (!regExp.hasMatch(value ?? '')) {
      return LocaleKeys.formValidation_notValid.locale;
    } else {
      return null;
    }
  }
}

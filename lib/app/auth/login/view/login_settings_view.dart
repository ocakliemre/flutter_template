import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../../../../app/auth/login/viewmodel/login_viewmodel.dart';
import '../../../../core/app_manager/model/settings_model.dart';
import '../../../../core/app_manager/viewmodel/app_manager_viewmodel.dart';
import '../../../../core/base/view/base_subview.dart';
import '../../../../core/enums/widget_enums.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/constants/color_constants.dart';
import '../../../../core/init/constants/widget_constants.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../core/validator/form_field_validator.dart';
import '../../../../core/widgets/buttons/large_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../locator.dart';

@RoutePage()
class LoginSettingsView extends StatefulWidget {
  const LoginSettingsView({super.key});

  @override
  State<LoginSettingsView> createState() => _LoginSettingsViewState();
}

class _LoginSettingsViewState extends State<LoginSettingsView> {
  late final LoginViewModel _loginViewModel;
  late final GlobalKey<FormState> _settingsFormKey;
  late final SettingsModel _settingsModel;
  bool sslActive = true;

  @override
  void initState() {
    super.initState();
    _settingsFormKey = GlobalKey<FormState>();
    _settingsModel = SettingsModel(ip: '', port: '');
    _loginViewModel = locator<LoginViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSubview(
      pageTitle: 'Sunucu Ayarları',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            buildForm(),
            buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _settingsFormKey,
      child: Expanded(
        child: Column(
          children: [
            buildIpTextField(),
            buildPortTextField(),
            buildSslSwitch(),
          ],
        ),
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: SizedBox(
        width: context.deviceWidth,
        child: LargeButton(
          buttonSize: ButtonSize.large,
          text: LocaleKeys.common_saveButtonText.locale,
          radius: WidgetConstants.borderRadius3,
          elevation: WidgetConstants.elevation2,
          backgroundColor: ColorConstants.primaryColor,
          style: context.appTheme().largeButtonDarkTextStyle,
          onPressed: () {
            saveServerParams();
          },
        ),
      ),
    );
  }

  Padding buildSslSwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('SSL ile bağlan'),
          CupertinoSwitch(
            value: sslActive,
            thumbColor: ColorConstants.westBay,
            onChanged: (value) {
              setState(() {
                sslActive = !sslActive;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildIpTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          context: context,
          controller: _loginViewModel.ipController,
          headerText: LocaleKeys.alertdialog_ipLabelText.locale,
          headerTextStyle: context.appTheme().textFieldHeaderTextStyle,
          keyboardType: TextInputType.number,
          validator: CustomFormFieldValidator(validateList: [
            Validate.checkEmpty,
          ]).checkValidations,
          onSaved: (newValue) {
            _settingsModel.ip = newValue?.trim() ?? '';
          },
        )
      ],
    );
  }

  Widget buildPortTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          context: context,
          controller: _loginViewModel.portController,
          headerText: LocaleKeys.alertdialog_portLabelText.locale,
          headerTextStyle: context.appTheme().textFieldHeaderTextStyle,
          keyboardType: TextInputType.number,
          validator: CustomFormFieldValidator(validateList: [
            Validate.checkEmpty,
            Validate.checkFormatPort,
          ]).checkValidations,
          onSaved: (newValue) {
            _settingsModel.port = newValue?.trim() ?? '';
          },
        )
      ],
    );
  }

  Future<void> saveServerParams() async {
    if (_settingsFormKey.currentState!.validate()) {
      _settingsFormKey.currentState?.save();

      await locator<AppManagerViewModel>().saveSettings(_settingsModel);

      // ignore: use_build_context_synchronously
      context.popRoute();
    }
  }
}

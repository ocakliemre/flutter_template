import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/app_manager/model/settings_model.dart';
import '../../../../core/app_manager/viewmodel/app_manager_viewmodel.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/init/constants/app_constants.dart';
import '../../../../core/init/constants/asset_constants.dart';
import '../../../../core/init/constants/color_constants.dart';
import '../../../../core/init/constants/widget_constants.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../core/logger/logger_mixin.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/navigator/app_router.dart';
import '../../../../core/utility/view_helper.dart';
import '../../../../core/validator/form_field_validator.dart';
import '../../../../core/widgets/button_group_widget.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../../../../core/widgets/custom_draggable_scrollable_sheet.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/buttons/large_button.dart';
import '../../../../core/widgets/buttons/rounded_icon_button.dart';
import '../../../../locator.dart';
import '../model/login_request_model.dart';
import '../viewmodel/login_viewmodel.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with LoggerViewMixin, ViewHelper {
  late final GlobalKey<FormState> _loginFormKey;
  late final LoginRequestModel _loginRequestModel;
  late final GlobalKey<FormState> _settingsFormKey;
  late final SettingsModel _settingsModel;
  late final LoginViewModel _loginViewModel;
  bool sslActive = true;

  @override
  void initState() {
    super.initState();

    _loginFormKey = GlobalKey<FormState>();
    _loginRequestModel = LoginRequestModel();
    _settingsFormKey = GlobalKey<FormState>();
    _settingsModel = SettingsModel(ip: '', port: '');
    _loginViewModel = locator<LoginViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModelBuilder: (_) => locator<LoginViewModel>(),
        builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, LoginViewModel loginViewModel) {
    {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: buildBody(context),
      );
    }
  }

  Stack buildBody(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: buildPrintflowLogo(
                        context: context,
                        image: const AssetImage(AssetConstants.printflowLogo),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: buildLoginLogo(
                          context: context,
                          image: const AssetImage(AssetConstants.loginLogo)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        buildCustomDraggableScrollableSheet(context),
      ],
    );
  }

  CustomDraggableScrollableSheet buildCustomDraggableScrollableSheet(
      BuildContext context) {
    return CustomDraggableScrollableSheet(
      minChildSize: 0.50,
      initialChildSize: 0.60,
      maxChildSize: 0.90,
      snapSizes: const [
        0.50,
        0.60,
        0.80,
        0.90,
      ],
      snap: true,
      backgroundColor: context.appTheme().loginTransparentContainerColor,
      scrollChanged: (value) {},
      child: buildLoginForm(),
    );
  }

  Widget buildPrintflowLogo({
    required BuildContext context,
    required AssetImage image,
  }) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Container buildLoginLogo({
    required BuildContext context,
    required AssetImage image,
  }) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildUsernameTextField(),
              buildPasswordTextField(),
              buildRememberMe(),
              buildLoginButton(),
              buildSettingsButton(),
              //kDebugMode ? buildDebugModeSwitch() : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDebugModeSwitch() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(WidgetConstants.borderRadius5),
          color: ColorConstants.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bug_report_rounded, color: ColorConstants.westBay),
            Flexible(
              child: Text(
                'Debug Mode',
                style: context.appTheme().largeButtonLightTextStyle,
                textAlign: TextAlign.end,
                overflow: TextOverflow.visible,
              ),
            ),
            Flexible(
              child: CupertinoSwitch(
                value: AppConstants.appMode == AppMode.debug ? true : false,
                thumbColor: ColorConstants.westBay,
                onChanged: (value) {
                  value
                      ? locator<AppManagerViewModel>().appMode = AppMode.debug
                      : locator<AppManagerViewModel>().appMode =
                          AppMode.release;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          checkColor: ColorConstants.white,
          fillColor: MaterialStateProperty.all(ColorConstants.steelGray),
          value: _loginViewModel.rememberMe,
          onChanged: (bool? value) {
            _loginViewModel.rememberMe = value ?? false;
          },
        ),
        Flexible(
          child: Text(
            LocaleKeys.login_rememberMeLabelText.locale,
            style: context.appTheme().largeButtonLightTextStyle,
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 180,
        height: 48,
        child: LargeButton(
          text: LocaleKeys.login_loginButtonLabelText.locale,
          style: context.appTheme().largeButtonDarkTextStyle,
          backgroundColor: ColorConstants.steelGray,
          onPressed: () => signIn(_loginViewModel),
        ),
      ),
    );
  }

  Widget buildSettingsButton() {
    return SizedBox(
      width: 180,
      height: 48,
      child: LargeButton(
        text: LocaleKeys.login_settingsLabelText.locale,
        style: context.appTheme().largeButtonLightTextStyle,
        backgroundColor: ColorConstants.white,
        borderColor: ColorConstants.steelGray,
        onPressed: () {
          context.router.push(const LoginSettingsRoute());
        },
      ),
    );
  }

  showSettingsDialog({
    required BuildContext context,
  }) async {
    await locator<AppManagerViewModel>().getSettingsFromDevice();

    // ignore: use_build_context_synchronously
    customDialogWidget(
      children: [
        Form(
          key: _settingsFormKey,
          child: Column(
            children: [
              buildIpTextField(),
              buildPortTextField(),
              Switch(
                value: sslActive,
                onChanged: (value) {
                  sslActive = !sslActive;
                  setState(() {});
                },
              ),
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
        )
      ],
      title: LocaleKeys.alertdialog_serverSettingsLabelText.locale,
      context: context,
      buttonType: DialogButtonType.ok,
      customButton: ButtonGroupWidget(
        primaryButtonText: LocaleKeys.common_saveButtonText.locale,
        onPressedPrimary: () {
          saveServerParams();
        },
        secondaryButtonText: LocaleKeys.common_backButtonText.locale,
        onPressedSecondary: () {
          context.popRoute();
        },
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

  Widget buildUsernameTextField() {
    return CustomTextField(
      context: context,
      isDense: false,
      controller: _loginViewModel.userNameController,
      headerText: LocaleKeys.login_userNameLabelText.locale,
      headerTextStyle: context.appTheme().textFieldHeaderTextStyle,
      keyboardType: TextInputType.text,
      autoValidateMode: AutovalidateMode.disabled,
      inputFormatters: [
        FilteringTextInputFormatter.deny(' '),
      ],
      validator: CustomFormFieldValidator(
        validateList: [
          Validate.checkEmpty,
        ],
      ).checkValidations,
      onSaved: (newValue) {
        _loginRequestModel.userName = newValue!.trim();
      },
    );
  }

  Widget buildPasswordTextField() {
    return CustomTextField(
      context: context,
      isDense: false,
      controller: _loginViewModel.passwordController,
      headerText: LocaleKeys.login_passwordLabelText.locale,
      headerTextStyle: context.appTheme().formHeaderTextStyle,
      obscureText: _loginViewModel.hidePassword,
      keyboardType: TextInputType.visiblePassword,
      autoValidateMode: AutovalidateMode.disabled,
      suffixIcon: showPasswordIconButton(),
      inputFormatters: [
        FilteringTextInputFormatter.deny(' '),
      ],
      validator: CustomFormFieldValidator(
        validateList: [
          Validate.checkEmpty,
        ],
      ).checkValidations,
      onSaved: (newValue) {
        _loginRequestModel.password = newValue!.trim();
      },
    );
  }

  RoundedIconButtonWidget showPasswordIconButton() {
    return RoundedIconButtonWidget(
      child: Icon(
        _loginViewModel.hidePassword ? Icons.visibility : Icons.visibility_off,
        color: context.appTheme().primaryColor,
      ),
      onTap: () {
        setState(() {
          _loginViewModel.hidePassword = !_loginViewModel.hidePassword;
        });
      },
    );
  }

  Future<void> signIn(LoginViewModel loginViewModel) async {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState?.save();

      await loginViewModel.checkServerParams().then((value) {
        if (value) {
          loginViewModel.signIn(_loginRequestModel).then((value) {
            if (value?.success ?? false) {
              context.replaceRoute(const MainRootRoute());
            }
          });
        } else {
          showSnackBarMessage(
            message: LocaleKeys.login_descriptionLabelText.locale,
          );
        }
      });
    }
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

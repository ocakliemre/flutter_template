import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../app/landing/walkthrough/model/walkthrough_model.dart';
import '../../../../app/landing/walkthrough/viewmodel/walkthrough_viewmodel.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/constants/animation_constants.dart';
import '../../../../core/init/constants/asset_constants.dart';
import '../../../../core/init/constants/color_constants.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../core/logger/logger_mixin.dart';
import '../../../../core/navigator/app_router.dart';
import '../../../../core/widgets/animation/custom_animated_cross_fade.dart';
import '../../../../core/widgets/buttons/mini_button_widget.dart';
import '../../../../core/widgets/indicator.dart';
import '../../../../locator.dart';

@RoutePage()
class WalkthroughView extends StatefulWidget {
  final bool? colorOff;

  const WalkthroughView({super.key, this.colorOff = false});

  @override
  State<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView>
    with LoggerViewMixin {
  int _selectedIndex = 0;
  late final PageController _pageController;
  bool isLastPage = false;
  bool isFirstPage = true;
  late final WalkthroughViewModel _walkthroughViewModel;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _walkthroughViewModel = locator<WalkthroughViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.animateToPage(_selectedIndex,
          duration: AnimationConstants.walkthroughSliderDuration,
          curve: Curves.easeInOut);
    });

    return BaseView(
        viewModelBuilder: (_) => locator<WalkthroughViewModel>(),
        builder: _buildScreen);
  }

  Widget _buildScreen(
      BuildContext context, WalkthroughViewModel walkthroughViewModel) {
    {
      return Scaffold(
        body: buildBackgroundTexture(
          child: buildPageBody(),
        ),
      );
    }
  }

  Column buildPageBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: buildPageView(),
        ),
        buildBottomButtons(),
      ],
    );
  }

  Container buildBackgroundTexture({
    required Widget child,
  }) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetConstants.backgroundTexture),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  Widget buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAnimatedCrossFade(
            firstChild:  buildSkipButton(),
            secondChild: buildBackButton(),
            crossFadeState: isFirstPage
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          buildIndicator(),
          CustomAnimatedCrossFade(
            firstChild: buildNextButton(),
            secondChild: buildLoginButton(),
            crossFadeState: isLastPage
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }

  MiniButtonWidget buildNextButton() {
    return MiniButtonWidget(
      icon: Icons.arrow_forward_ios_rounded,
      iconFirst: false,
      iconSize: 28,
      text: LocaleKeys.walkthrough_nextLabelText.locale,
      showBorder: false,
      textStyle: const TextStyle(
        color: ColorConstants.softGrey,
      ),
      onTap: () {
        setState(() {
          _selectedIndex += 1;
        });
      },
    );
  }

  MiniButtonWidget buildSkipButton() {
    return MiniButtonWidget(
        icon: Icons.login,
        iconFirst: false,
        iconSize: 28,
        text: LocaleKeys.walkthrough_skipLabelText.locale,
        showBorder: false,
        textStyle: const TextStyle(
          color: ColorConstants.softGrey,
        ),
        onTap: () {
          context.router.push(const LoginMainRoute());
        });
  }

  MiniButtonWidget buildLoginButton() {
    return MiniButtonWidget(
        icon: Icons.login,
        iconFirst: false,
        iconSize: 28,
        text: LocaleKeys.walkthrough_loginLabelText.locale,
        showBorder: false,
        textStyle: const TextStyle(
          color: ColorConstants.softGrey,
        ),
        onTap: () {
          context.replaceRoute(const LoginRoute());
        });
  }

  MiniButtonWidget buildBackButton() {
    return MiniButtonWidget(
      icon: Icons.arrow_back_ios_new_rounded,
      iconSize: 28,
      iconFirst: true,
      text: LocaleKeys.walkthrough_backLabelText.locale,
      showBorder: false,
      textStyle: const TextStyle(
        color: ColorConstants.softGrey,
      ),
      onTap: () {
        setState(() {
          _selectedIndex -= 1;
        });
      },
    );
  }

  Widget buildPageView() {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
          isLastPage =
              (index == _walkthroughViewModel.walkthroughList.length - 1);
          isFirstPage = index == 0 ? true : false;
        });
      },
      controller: _pageController,
      itemCount: _walkthroughViewModel.walkthroughList.length,
      itemBuilder: (context, index) {
        return buildSliderBody(
            walkthroughModel: _walkthroughViewModel.walkthroughList[index]);
      },
    );
  }

  Widget buildSliderBody({
    required WalkthroughModel walkthroughModel,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth(0.07),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(walkthroughModel),
          buildTexts(walkthroughModel),
        ],
      ),
    );
  }

  Widget buildTexts(WalkthroughModel walkthroughModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTitleText(walkthroughModel),
          buildDescriptionText(walkthroughModel),
        ],
      ),
    );
  }

  Widget buildDescriptionText(WalkthroughModel walkthroughModel) {
    return Text(
      walkthroughModel.description ?? '',
      style: context.appTheme().walkthroughDescriptionTextStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget buildImage(
    WalkthroughModel walkthroughModel,
  ) {
    return Image(
      height: context.dynamicHeight(0.4),
      alignment: AlignmentDirectional.bottomEnd,
      image: AssetImage(
        walkthroughModel.image ?? '',
      ),
    );
  }

  Widget buildTitleText(WalkthroughModel walkthroughModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        walkthroughModel.title ?? '',
        style: context.appTheme().walkthroughTitleTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          _walkthroughViewModel.walkthroughList.length,
          (index) => Indicator(
            isActive: _selectedIndex == index ? true : false,
          ),
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../init/constants/color_constants.dart';
import '../init/constants/widget_constants.dart';
import 'buttons/rounded_icon_button.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    this.child,
    required this.context,
    required this.label,
    this.changeSearchVisibility,
    this.showSearch = false,
    this.showBackButton = true,
    this.leadingItem,
    this.actionItems,
    this.appBarHeight,
    this.bottomWidget,
    super.key,
  }) : super(
          title: child ?? Text(label),
          leading: showBackButton ? buildBackButton(context) : leadingItem,
          backgroundColor: context.appTheme().primaryColor,
          titleTextStyle: context.appTheme().appbarTitleTextStyle,
          iconTheme: IconThemeData(
              color: context.appTheme().appbarTitleTextStyle.color),
          toolbarHeight: appBarHeight,
          shape: const RoundedRectangleBorder(
              /* borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.elliptical(20.0, WidgetConstants.borderRadius6),
              bottomRight:
                  Radius.elliptical(20.0, WidgetConstants.borderRadius6),
            ),*/
              ),
          actions: showSearch
              ? [
                  buildSearchButton(
                    context: context,
                    changeSearchVisibility: changeSearchVisibility,
                  )
                ]
              : actionItems,
          bottom: bottomWidget,
        );

  final String label;
  final VoidCallback? changeSearchVisibility;
  final bool showBackButton;
  final bool showSearch;
  final Widget? leadingItem;
  final List<Widget>? actionItems;
  final BuildContext context;
  final Widget? child;
  final double? appBarHeight;
  final PreferredSizeWidget? bottomWidget;

  static RoundedIconButtonWidget buildBackButton(BuildContext context) {
    return RoundedIconButtonWidget(
      child: const Icon(Icons.arrow_back),
      onTap: () {
        if (context.router.canPop()) {
          context.router.pop();
        }
      },
    );
  }

  static buildSearchButton({
    required BuildContext context,
    required VoidCallback? changeSearchVisibility,
  }) {
    return RoundedIconButtonWidget(
      padding: WidgetConstants.padding2,
      onTap: changeSearchVisibility!,
      child: const Icon(
        Icons.search_rounded,
        color: ColorConstants.white,
      ),
    );
  }
}

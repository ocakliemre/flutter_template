import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../enums/widget_enums.dart';
import '../../init/constants/color_constants.dart';
import '../../init/constants/widget_constants.dart';
import '../../init/language/locale_keys.g.dart';
import '../buttons/large_button.dart';
import '../buttons/mini_button_widget.dart';
import 'filters/filter_item.dart';

class FilterView extends StatefulWidget {
  const FilterView({
    super.key,
    required this.filterItems,
    required this.applyFilter,
    required this.clearFilter,
  });

  @override
  State<FilterView> createState() => _FilterViewState();

  final List<FilterItem> filterItems;
  final VoidCallback applyFilter;
  final VoidCallback clearFilter;
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildHeader(),
              buildFilterItems(),
            ],
          ),
          buildApplyButton()
        ],
      ),
    );
  }

  ListView buildFilterItems() {
    return ListView.separated(
      itemCount: widget.filterItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: WidgetConstants.padding2),
      itemBuilder: (context, index) {
        return widget.filterItems[index];
      },
      separatorBuilder: (context, index) {
        return buildFilterItemSeparator(context);
      },
    );
  }

  Padding buildFilterItemSeparator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
      child: const Divider(),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: WidgetConstants.padding1,
          right: WidgetConstants.padding2,
          left: WidgetConstants.padding2),
      child: SizedBox(
        width: context.deviceWidth,
        height: 40,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Text(
              LocaleKeys.filter_filtreLabelText.locale,
              textAlign: TextAlign.center,
              style: context.appTheme().bottomSheetTitleTextStyle,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: buildClearButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildApplyButton() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 60,
          bottom: WidgetConstants.padding1,
          right: WidgetConstants.padding3,
          left: WidgetConstants.padding3),
      child: LargeButton(
        buttonSize: ButtonSize.large,
        text: LocaleKeys.filter_applyLabelText.locale,
        radius: WidgetConstants.borderRadius3,
        elevation: WidgetConstants.elevation2,
        backgroundColor: ColorConstants.smoky,
        style: context.appTheme().largeButtonDarkTextStyle,
        onPressed: () {
          widget.applyFilter();
          context.router.root.pop();
        },
      ),
    );
  }

  MiniButtonWidget buildClearButton() {
    return MiniButtonWidget(
      text: LocaleKeys.filter_clearLabelText.locale,
      textStyle: context
          .appTheme()
          .miniButtonTextStyle
          .copyWith(color: ColorConstants.softGrey),
      showBorder: false,
      onTap: () {
        widget.clearFilter();
        context.router.root.pop();
      },
    );
  }
}

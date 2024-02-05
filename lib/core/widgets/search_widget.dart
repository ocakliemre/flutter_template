import '../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../core/init/constants/color_constants.dart';
import '../../../core/init/constants/widget_constants.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/widgets/animation/custom_animated_cross_fade.dart';
import '../../../core/widgets/filter_view/filter_view.dart';
import '../../../core/widgets/filter_view/filters/filter_item.dart';
import '../../../core/widgets/buttons/mini_button_widget.dart';
import '../../../core/widgets/buttons/rounded_icon_button.dart';
import '../../../core/extensions/string_extension.dart';
import 'custom_bottom_sheet.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.changeVisibility,
    required this.isVisible,
    required this.applyFilter,
    required this.clearFilter,
    this.filters,
    this.controller,
    this.textChanged,
    this.resultItemCount = 0,
    this.isFiltered = false,
  });

  final ValueChanged<bool> changeVisibility;
  final bool isVisible;
  final List<FilterItem>? filters;
  final VoidCallback applyFilter;
  final VoidCallback clearFilter;
  final TextEditingController? controller;
  final ValueChanged<String>? textChanged;
  final int resultItemCount;
  final bool isFiltered;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomAnimatedCrossFade(
      firstChild: Column(
        children: [
          buildSearch(context),
          widget.isFiltered ? buildFilterStatusInfo() : Container(),
        ],
      ),
      secondChild: widget.isFiltered ? buildFilterStatusInfo() : Container(),
      crossFadeState: widget.isVisible
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }

  Container buildFilterStatusInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: WidgetConstants.padding2,
        vertical: WidgetConstants.padding4,
      ),
      color: ColorConstants.transparent,
      child: Material(
        color: ColorConstants.transparent,
        elevation: WidgetConstants.elevation4,
        borderRadius: BorderRadius.circular(
          WidgetConstants.borderRadius4,
        ),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(
              WidgetConstants.borderRadius4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 5.0,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      Icons.filter_list_rounded,
                      color: ColorConstants.curiousBlue,
                    ),
                    Text(
                      '${widget.resultItemCount} '
                      '${LocaleKeys.search_recordListedLabelText.locale}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                MiniButtonWidget(
                  text: LocaleKeys.search_removeFilterLabelText.locale,
                  textStyle: context.appTheme().miniButtonTextStyle.copyWith(
                        color: ColorConstants.curiousBlue,
                      ),
                  showBorder: false,
                  onTap: widget.clearFilter,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildSearch(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: WidgetConstants.padding2,
          vertical: WidgetConstants.padding3),
      color: ColorConstants.transparent,
      child: Material(
        color: ColorConstants.transparent,
        elevation: WidgetConstants.elevation4,
        borderRadius: BorderRadius.circular(WidgetConstants.borderRadius4),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(WidgetConstants.borderRadius4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: buildTextFormField(),
              ),
              Row(
                children: [
                  widget.filters != null
                      ? (buildFilterButton(context))
                      : Container(),
                  buildDivider(),
                  buildCloseAndClearButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
      onChanged: widget.textChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: ColorConstants.softGrey,
        ),
        hintText: LocaleKeys.search_searchTextLabelText.locale,
        border: InputBorder.none,
      ),
    );
  }

  RoundedIconButtonWidget buildFilterButton(BuildContext context) {
    return RoundedIconButtonWidget(
      padding: WidgetConstants.padding3,
      child: const Icon(
        Icons.filter_alt_rounded,
        color: ColorConstants.curiousBlue,
      ),
      onTap: () {
        CustomBottomSheet(
            context: context,
            child: FilterView(
              filterItems: widget.filters ?? [],
              applyFilter: widget.applyFilter,
              clearFilter: widget.clearFilter,
            ));
      },
    );
  }

  VerticalDivider buildDivider() {
    return const VerticalDivider(
      color: ColorConstants.transparentGrey,
      thickness: 1,
    );
  }

  RoundedIconButtonWidget buildCloseAndClearButton() {
    return RoundedIconButtonWidget(
      padding: WidgetConstants.padding3,
      child: const Icon(
        Icons.close_rounded,
        color: ColorConstants.softGrey,
      ),
      onTap: () {
        widget.changeVisibility(!widget.isVisible);
        widget.clearFilter();
      },
    );
  }
}

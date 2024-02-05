import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/extensions/context_extension.dart';
import '../../../init/constants/color_constants.dart';
import '../../../init/constants/format_constants.dart';
import '../../../init/constants/widget_constants.dart';
import 'base_filter.dart';
import 'filter_item.dart';

class DateRangeFilter extends StatefulWidget implements BaseFilter {
  DateRangeFilter({
    super.key,
    required this.onValueChanged,
    required this.dateTimeRange,
  });

  DateTimeRange dateTimeRange;
  bool isFiltered = false;

  @override
  State<DateRangeFilter> createState() => _DateRangeFilterState();

  @override
  FilterItem toFilterItem(String title) {
    return FilterItem(
      title: title,
      child: this,
    );
  }

  @override
  final ValueChanged<DateTimeRange> onValueChanged;
}

class _DateRangeFilterState extends State<DateRangeFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                  borderRadius:
                      BorderRadius.circular(WidgetConstants.borderRadius5),
                  onTap: changeDateRange,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(WidgetConstants.borderRadius5),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        buildCalendarIcon(context),
                        buildDateText(
                          context: context,
                          title: 'Start:',
                          selectedDate: widget.dateTimeRange.start,
                          textAlign: TextAlign.end,
                        ),
                        buildDivider(),
                        buildDateText(
                          context: context,
                          title: 'End:',
                          selectedDate: widget.dateTimeRange.end,
                          textAlign: TextAlign.start,
                        ),
                        buildEmptyContainer(context),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: WidgetConstants.padding4),
      child: SizedBox(
        width: 10,
        height: 10,
        child: Divider(
          thickness: 1,
          color: ColorConstants.transparentGrey,
        ),
      ),
    );
  }

  Padding buildCalendarIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: WidgetConstants.padding5),
      child: Icon(
        Icons.calendar_month_rounded,
        color: context.appTheme().primaryColor,
      ),
    );
  }

  Padding buildEmptyContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: WidgetConstants.padding5),
      child: Container(
        width: 30,
      ),
    );
  }

  Widget buildDateText({
    required BuildContext context,
    required String title,
    required DateTime selectedDate,
    required TextAlign textAlign,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(title,
              overflow: TextOverflow.visible,
              textAlign: textAlign,
              maxLines: 1,
              style: context
                  .appTheme()
                  .filterTitleTextStyle
                  .copyWith(color: ColorConstants.coralTree)),
        ),
        Text(
          DateFormat(FormatConstants.filterDateTimeFormat).format(selectedDate),
          overflow: TextOverflow.visible,
          textAlign: textAlign,
          maxLines: 1,
          style: TextStyle(
              fontWeight:
                  widget.isFiltered ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  void changeDateRange() {
    showDateRangePicker(
      context: context,
      firstDate: widget.dateTimeRange.start,
      lastDate: widget.dateTimeRange.end,
      useRootNavigator: true,
    ).then((value) {
      if (value != widget.dateTimeRange) {
        widget.isFiltered = true;
      } else {
        widget.isFiltered = false;
      }

      setState(() {
        widget.dateTimeRange = value ?? widget.dateTimeRange;
      });
      widget.onValueChanged(value ?? widget.dateTimeRange);
    });
  }
}

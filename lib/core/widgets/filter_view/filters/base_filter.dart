import 'package:flutter/material.dart';
import 'filter_item.dart';

abstract class BaseFilter extends Widget {
  const BaseFilter({
    required this.onValueChanged,
    super.key,
  });

  FilterItem toFilterItem(String title);
  final ValueChanged<DateTimeRange> onValueChanged;
}

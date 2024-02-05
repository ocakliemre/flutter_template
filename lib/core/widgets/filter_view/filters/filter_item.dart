import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';
import 'base_filter.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final BaseFilter child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFilterTitle(
          context: context,
          title: title,
        ),
        child,
      ],
    );
  }

  Text buildFilterTitle({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: context.appTheme().filterTitleTextStyle,
    );
  }
}

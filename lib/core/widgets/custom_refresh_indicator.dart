import 'package:flutter/material.dart';
import '../../../core/base/viewmodel/base_viewmodel.dart';

class CustomRefreshIndicator extends StatefulWidget {
  const CustomRefreshIndicator(
      {super.key,
      required this.viewModel,
      required this.refreshFunc,
      required this.child});
  final BaseViewModel? viewModel;
  final dynamic refreshFunc;
  final Widget child;

  @override
  State<CustomRefreshIndicator> createState() => _CustomRefreshIndicatorState();
}

class _CustomRefreshIndicatorState extends State<CustomRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.viewModel?.refreshIndicatorRunning = true;
        await widget.refreshFunc();
        widget.viewModel?.refreshIndicatorRunning = false;
      },
      child: widget.child,
    );
  }
}

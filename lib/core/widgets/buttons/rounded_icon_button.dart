import 'package:flutter/material.dart';
import '../../init/constants/color_constants.dart';

class RoundedIconButtonWidget extends StatelessWidget {
  const RoundedIconButtonWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor = ColorConstants.transparent,
    this.padding = 0,

  });

  final Widget child;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(60)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(60)),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}

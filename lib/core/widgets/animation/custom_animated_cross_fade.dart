import 'package:flutter/material.dart';
import '../../init/constants/animation_constants.dart';

class CustomAnimatedCrossFade extends StatefulWidget {
  const CustomAnimatedCrossFade({
    super.key,
    required this.firstChild,
    required this.secondChild,
    required this.crossFadeState,
    this.duration = AnimationConstants.duration3,
    this.firstCurve = Curves.easeInQuart,
    this.secondCurve = Curves.easeInQuart,
  });

  final Widget firstChild;
  final Widget secondChild;
  final CrossFadeState crossFadeState;
  final Duration duration;
  final Curve firstCurve;
  final Curve secondCurve;

  @override
  State<CustomAnimatedCrossFade> createState() =>
      _CustomAnimatedCrossFadeState();
}

class _CustomAnimatedCrossFadeState extends State<CustomAnimatedCrossFade> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: AlignmentDirectional.center,
      firstChild: widget.firstChild,
      secondChild: widget.secondChild,
      crossFadeState: widget.crossFadeState,
      duration: widget.duration,
      reverseDuration:  widget.duration,
    );
  }
}

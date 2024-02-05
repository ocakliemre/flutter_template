import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double? radius;
  final Color? backgroundColor;
  final String? text;
  const CircleAvatarWidget({
    super.key,
    this.radius,
    this.backgroundColor,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(text!),
    );
  }
}

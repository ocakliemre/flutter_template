import 'package:flutter/material.dart';

import '../init/constants/app_constants.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
    this.duration,
    this.message,
  });

  final Duration? duration;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return snackBar();
  }

  Widget snackBar() {
    return SnackBar(
      backgroundColor: Colors.black,
      duration: duration ?? AppConstants.snackBarDurationMid,
      content: Text(message ?? ''),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      padding:
          const EdgeInsets.only(right: 5.0, left: 15.0, bottom: 8.0, top: 8.0),
      closeIconColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

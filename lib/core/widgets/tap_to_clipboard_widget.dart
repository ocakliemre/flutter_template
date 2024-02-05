import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/init/constants/app_constants.dart';
import '../../core/utility/view_helper.dart';

class TapToClipboardWidget extends StatelessWidget with ViewHelper {
  const TapToClipboardWidget({
    super.key,
    required this.child,
  });

  final Text child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      child: child,
      onLongPress: () async {
        await Clipboard.setData(ClipboardData(text: child.data ?? ''))
            .then((value) {
          showSnackBarMessage(
              message: 'Kopyalandı: ${child.data}',
              duration: AppConstants.snackBarDurationShort);
        });
      },
    );
  }
}

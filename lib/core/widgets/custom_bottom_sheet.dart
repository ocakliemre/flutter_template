import 'package:flutter/material.dart';

import '../init/constants/color_constants.dart';
import '../init/constants/widget_constants.dart';

class CustomBottomSheet {
  final BuildContext context;
  final Widget child;
  final bool? childSize;

  CustomBottomSheet({
    this.childSize = true,
    required this.context,
    required this.child,
  }) {
    show();
  }

  show() {
    showModalBottomSheet(
      backgroundColor: ColorConstants.gallery,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      barrierColor: ColorConstants.black.withOpacity(0.8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(WidgetConstants.borderRadius1)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: childSize == false
              ? DraggableScrollableSheet(
                  initialChildSize: 0.65,
                  minChildSize: 0.65,
                  expand: false,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildNotch(),
                          child,
                        ],
                      ),
                    );
                  })
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildNotch(),
                      child,
                    ],
                  ),
                ),
        );
      },
    );
  }

  static Padding buildNotch() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 35,
        height: 4,
        margin: const EdgeInsets.all(WidgetConstants.padding5),
        decoration: BoxDecoration(
          color: ColorConstants.sinbad,
          borderRadius: BorderRadius.circular(WidgetConstants.borderRadius6),
        ),
      ),
    );
  }
}

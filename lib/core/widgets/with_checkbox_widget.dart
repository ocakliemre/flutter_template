import 'package:flutter/material.dart';
import 'checkbox_widget.dart';

class WithCheckBoxWidget extends StatefulWidget {
  const WithCheckBoxWidget({
    super.key,
    this.child,
    this.checkBoxChanged,
    this.checkBoxKey,
    this.isDisabled,
    this.initialValue,
    this.isCentered = false,
  });

  final Widget? child;
  final ValueChanged<bool?>? checkBoxChanged;
  final Key? checkBoxKey;
  final bool? isDisabled;
  final bool? initialValue;
  final bool? isCentered;

  @override
  State<WithCheckBoxWidget> createState() => _WithCheckBoxWidgetState();
}

class _WithCheckBoxWidgetState extends State<WithCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: (widget.isCentered ?? false)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        widget.child != null
            ? Expanded(
                flex: 10,
                child: widget.child!,
              )
            : Container(),
        widget.child != null
            ? Expanded(
                flex: 2,
                child: buildCheckbox(),
              )
            : buildCheckbox(),
      ],
    );
  }

  Padding buildCheckbox() {
    return Padding(
      padding:
          EdgeInsets.only(top: (widget.isCentered ?? false) ? 0 : 36, left: 8),
      child: CheckBoxWidget(
        isChecked: widget.initialValue ?? false,
        key: widget.checkBoxKey,
        isDisabled: widget.isDisabled ?? false,
        onChanged: widget.checkBoxChanged ?? (value) {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../init/constants/color_constants.dart';

// ignore: must_be_immutable
class CheckBoxWidget extends StatefulWidget {
  final Key? checkBoxKey;
  final Color? activeColor;
  final Color? checkColor;
  late bool? isChecked;
  final ValueChanged<bool?>? onChanged;
  final bool isDisabled;
  final Widget? child;
  final String? text;

  CheckBoxWidget({
    super.key,
    this.checkBoxKey,
    this.activeColor,
    this.checkColor,
    this.isChecked = false,
    this.onChanged,
    this.isDisabled = false,
    this.child,
    this.text,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            key: widget.checkBoxKey,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: widget.activeColor ?? ColorConstants.primaryColor,
            checkColor: ColorConstants.white,
            value: widget.isChecked,
            onChanged: widget.isDisabled
                ? null
                : (bool? value) {
                    setState(() {
                      widget.isChecked = value!;
                    });
                    widget.onChanged!(value);
                  },
          ),
        ),
        widget.text != null
            ? Text(widget.text ?? '')
            : widget.child ?? Container(),
      ],
    );
  }
}

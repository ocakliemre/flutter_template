import 'package:flutter/material.dart';
import '../../../app/sample/viewmodel/sample_viewmodel.dart';
import '../../../core/base/view/base_subview.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/logger/logger_mixin.dart';
import '../../../locator.dart';

class SampleView extends StatefulWidget {
  const SampleView({super.key});

  @override
  State<SampleView> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> with LoggerViewMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModelBuilder: (_) => locator<SampleViewModel>(), builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, SampleViewModel sampleViewModel) {
    {
      return BaseSubview(
        pageTitle: 'pageTitle',
        child: Container(),
      );
    }
  }
}

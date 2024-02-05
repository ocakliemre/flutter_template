import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext)? viewModelBuilder;
  final Widget Function(BuildContext, T)? builder;
  final bool showAppBar;

  const BaseView({
    super.key,
    required this.viewModelBuilder,
    required this.builder,
    this.showAppBar = false,
  }) : assert(viewModelBuilder != null, builder != null);

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.viewModelBuilder!(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(BuildContext context, T viewModel, Widget? child) {
    final router = context.router;

    return WillPopScope(
      onWillPop: () {
        if (router.canPop()) {
          return SynchronousFuture(true /*router.canNavigateBack*/);
        } else {
          return SynchronousFuture(false /*router.canNavigateBack*/);
        }
      },
      child: Stack(
        children: [
          buildBody(
              context: context,
              viewModel: viewModel,
              showAppBar: widget.showAppBar),
          buildLoadingView(viewModel: viewModel)
        ],
      ),
    );
  }

  FutureBuilder<dynamic> buildLoadingView({
    required T viewModel,
  }) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 0)),
      builder: (context, snapshot) => Visibility(
        visible: viewModel.refreshIndicatorRunning
            ? false
            : (viewModel.viewState ==
                ViewState
                    .loading /* ||
                snapshot.connectionState == ConnectionState.waiting*/
            ),
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Widget buildBody({
    required BuildContext context,
    required T viewModel,
    required bool showAppBar,
  }) {
    return widget.builder!(context, viewModel);
  }
}

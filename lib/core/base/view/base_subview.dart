import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_refresh_indicator.dart';
import '../../widgets/filter_view/filters/filter_item.dart';
import '../../widgets/search_widget.dart';
import '../viewmodel/base_viewmodel.dart';

class BaseSubview extends StatefulWidget {
  const BaseSubview({
    super.key,
    required this.child,
    required this.pageTitle,
    this.applyFilter,
    this.clearFilter,
    this.showAppBar = true,
    this.showSearch = false,
    this.customAppBar,
    this.viewModel,
    this.refreshFunc,
    this.filters,
    this.searchTextController,
    this.textChanged,
    this.resultItemCount = 0,
    this.isFiltered = false,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.tabBarRoutes,
    this.tabBarTabs,
    this.currentTabIndex,
  });

  final Widget child;
  final String pageTitle;
  final bool showAppBar;
  final bool showSearch;
  final List<FilterItem>? filters;
  final PreferredSizeWidget? customAppBar;
  final BaseViewModel? viewModel;
  final dynamic refreshFunc;
  final VoidCallback? applyFilter;
  final VoidCallback? clearFilter;
  final TextEditingController? searchTextController;
  final ValueChanged<String>? textChanged;
  final int resultItemCount;
  final bool isFiltered;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final List<PageRouteInfo>? tabBarRoutes;
  final List<Tab>? tabBarTabs;
  final ValueChanged<int>? currentTabIndex;

  @override
  State<BaseSubview> createState() => _BaseSubviewState();
}

class _BaseSubviewState extends State<BaseSubview> {
  bool showSearchBox = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.tabBarRoutes == null
        ? buildPageBody(child: widget.child)
        : AutoTabsRouter.tabBar(
            routes: widget.tabBarRoutes!,
            builder: (context, child, tabController) {
              //final router = AutoTabsRouter.of(context);
              return buildPageBody(
                tabController: tabController,
                child: child,
              );
            },
          );
  }

  Scaffold buildPageBody({
    TabController? tabController,
    required Widget child,
  }) {
    if (widget.currentTabIndex != null && tabController?.index != null) {
      widget.currentTabIndex!(tabController!.index.toInt());
    }

    return Scaffold(
      appBar: widget.customAppBar ??
          (widget.showAppBar == false
              ? null
              : CustomAppBar(
                  context: context,
                  label: widget.pageTitle,
                  showSearch: widget.showSearch,
                  bottomWidget: tabController == null
                      ? null
                      : buildTabBar(
                          tabController: tabController,
                          tabBarTabs: widget.tabBarTabs ?? [],
                        ),
                  changeSearchVisibility: () {
                    setState(() {
                      showSearchBox = !showSearchBox;
                    });
                  },
                )),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      extendBody: widget.extendBody,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).padding.bottom,
      ),
      body: SizedBox(
        height: context.deviceHeight,
        width: context.deviceWidth,
        child: Column(
          children: [
            SearchWidget(
              controller: widget.searchTextController,
              textChanged: widget.textChanged,
              isVisible: showSearchBox,
              filters: widget.filters,
              isFiltered: widget.isFiltered,
              resultItemCount: widget.resultItemCount,
              applyFilter: widget.applyFilter ?? () {},
              clearFilter: widget.clearFilter ?? () {},
              changeVisibility: (value) {
                setState(() {
                  showSearchBox = value;
                });
              },
            ),
            Expanded(
              child: CustomRefreshIndicator(
                viewModel: widget.viewModel,
                refreshFunc: widget.refreshFunc,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBar buildTabBar({
    required TabController? tabController,
    required List<Tab> tabBarTabs,
  }) {
    return TabBar(
      controller: tabController,
      tabs: tabBarTabs,
    );
  }
}

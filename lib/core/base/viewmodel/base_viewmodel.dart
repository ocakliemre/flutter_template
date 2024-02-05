import 'dart:async';
import 'package:flutter/material.dart';

enum ViewState {
  idle,
  loading,
  loaded,
  error,
  disposed,
}

abstract class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  bool refreshIndicatorRunning = false;
  late final ValueChanged<String>? textChanged;
  void clearFilter();
  void applyFilter(BuildContext context);
  void applySearch(String value);

  BaseViewModel() {
    init();
  }

  FutureOr<void> init();

  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    scheduleMicrotask(() {
      notifyListeners();
    });
  } //Setters

  void reloadState() {
    if (viewState != ViewState.loading) notifyListeners();
  }

  @override
  void dispose() {
    viewState = ViewState.disposed;
    super.dispose();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/base/viewmodel/base_viewmodel.dart';
import '../repository/sample_repository.dart';

class SampleViewModel extends BaseViewModel {
  late final SampleRepository _sampleRepository;

  @override
  FutureOr<void> init() {
    _sampleRepository = SampleRepository();
  }

  Future<void> getSampleRequest() async {
    viewState = ViewState.loading;
    final response = await _sampleRepository.getSampleRequest();
    viewState = ViewState.loaded;

    debugPrint(response.toString());
  }

  @override
  void clearFilter() {}

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {
  }
}

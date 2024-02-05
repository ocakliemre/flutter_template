import '../../../core/enums/app_enums.dart';
import '../../../core/init/constants/app_constants.dart';
import '../model/sample_model.dart';
import '../service/sample_mock_service.dart';
import '../service/sample_service.dart';
import '../service/sample_service_interface.dart';

class SampleRepository extends ISampleService {
  late final SampleService _sampleService;
  late final SampleMockService _sampleMockService;

  SampleRepository() {
    _sampleService = SampleService();
    _sampleMockService = SampleMockService();
  }

  @override
  Future<SampleModel> getSampleRequest() async {
    if (AppConstants.appMode == AppMode.release) {
      return await _sampleService.getSampleRequest();
    } else {
      return await _sampleMockService.getSampleRequest();
    }
  }
}

import '../../../app/sample/service/sample_service_interface.dart';
import '../model/sample_model.dart';

class SampleMockService extends ISampleService {
  final SampleModel _mockSampleModel = SampleModel(title: 'Title', id: 1234);

  @override
  Future<SampleModel> getSampleRequest() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockSampleModel;
  }
}

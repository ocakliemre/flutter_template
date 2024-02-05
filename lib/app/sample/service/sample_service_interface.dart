import '../model/sample_model.dart';

abstract class ISampleService {
  Future<SampleModel> getSampleRequest();
}

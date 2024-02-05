import '../../../app/sample/model/sample_model.dart';
import '../../../app/sample/service/sample_service_interface.dart';
import '../../../core/utility/service_helper.dart';

class SampleService extends ISampleService with ServiceHelper {
  @override
  Future<SampleModel> getSampleRequest() async {
    throw UnimplementedError();
  }
}

import 'package:crypto_detect/data/service/analyze_image_service.dart';
import 'package:get_it/get_it.dart';

class DiService {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() => AnalyzeImageService(getIt.get()));
  }
}

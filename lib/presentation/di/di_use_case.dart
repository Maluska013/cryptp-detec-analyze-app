import 'package:crypto_detect/data/use_case/analyze_image_use_case.dart';
import 'package:get_it/get_it.dart';

class DiUseCase {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() => AnalyzeImageUseCase(getIt.get()));
  }
}

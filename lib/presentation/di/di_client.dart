import 'package:crypto_detect/data/endpoint/analyze_image_endpoint.dart';
import 'package:crypto_detect/remote_config/dio_api.dart';
import 'package:get_it/get_it.dart';

class DiClient {
  static Future<void> setUp(GetIt getIt) async {
    final dio = DioExtenssion.apiClient();
    getIt.registerFactory(() => AnalyzeImageEndpoint(dio));
  }
}

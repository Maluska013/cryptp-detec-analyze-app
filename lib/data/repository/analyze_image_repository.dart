import 'package:crypto_detect/data/model/analyze_request_model.dart';
import 'package:crypto_detect/data/model/analyze_response_model.dart';
import 'package:crypto_detect/data/service/analyze_image_service.dart';
import 'package:crypto_detect/domain/repository/analyze_image_repository.dart';
import 'package:crypto_detect/remote_config/app_response.dart';
import 'package:crypto_detect/remote_config/response_extesion.dart';

class AnalyzeImageRepositoryImpl implements AnalyzeImageRepository {
  final AnalyzeImageService _analyzeImageService;

  AnalyzeImageRepositoryImpl(this._analyzeImageService);

  @override
  Future<AppResponse<AnalyzeResponse>> analyzeResult(AnalyzeRequest request) async {
    final response = await _analyzeImageService.analyzeImage(request).apiConverse();
    return response.when(onSuccess: (result) {
      return AppResponse.success(result);
    }, onError: (error) {
      return AppResponse.error(error);
    });
  }
}

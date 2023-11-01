import 'package:crypto_detect/data/model/analyze_request_model.dart';
import 'package:crypto_detect/data/model/analyze_response_model.dart';
import 'package:crypto_detect/domain/repository/analyze_image_repository.dart';
import 'package:crypto_detect/remote_config/app_response.dart';

class AnalyzeImageUseCase {
  final AnalyzeImageRepository _imageRepository;

  AnalyzeImageUseCase(this._imageRepository);
  Future<AppResponse<AnalyzeResponse>> call(AnalyzeRequest request) async {
    final response = await _imageRepository.analyzeResult(request);
    return response;
  }
}

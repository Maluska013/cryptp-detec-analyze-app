import 'package:camera/camera.dart';
import 'package:crypto_detect/data/repository/analyze_image_repository.dart';
import 'package:crypto_detect/data/repository/samples_repostory.dart';
import 'package:crypto_detect/domain/repository/analyze_image_repository.dart';
import 'package:crypto_detect/domain/repository/media_repository.dart';
import 'package:crypto_detect/domain/repository/sample_repository.dart';
import 'package:get_it/get_it.dart';

class DiRepository {
  static Future<void> setUp(GetIt getIt) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    getIt.registerLazySingleton(() => MediaRepository(getIt.get(), firstCamera));
    getIt.registerLazySingleton<AnalyzeImageRepository>(() => AnalyzeImageRepositoryImpl(getIt.get()));
    getIt.registerLazySingleton<SampleRepository>(() => SampleRepositoryImplement());
  }
}

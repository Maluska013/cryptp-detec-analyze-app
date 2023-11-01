import 'package:crypto_detect/presentation/history/history_samples_vm.dart';
import 'package:crypto_detect/presentation/history/sample_detail/sample_detail_vm.dart';
import 'package:crypto_detect/presentation/home/home_vm.dart';
import 'package:crypto_detect/presentation/image_scan/photo_vm.dart';
import 'package:get_it/get_it.dart';

import '../image_scan/confirm_scan/confirm_scan_vm.dart';

class DiViewModel {
  static void setUp(GetIt getIt) {
    getIt.registerFactory(() => HomeViewModel());
    getIt.registerFactory(() => HistorySampleViewModel(getIt.get()));
    getIt.registerFactory(() => SampleDetailViewModel(getIt.get()));
    getIt.registerFactory(() => PhotoGalleryViewModel(getIt.get()));
    getIt.registerFactory(() => ConfirmScanViewModel(getIt.get()));
  }
}

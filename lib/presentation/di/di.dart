import 'package:crypto_detect/presentation/di/di_adapter.dart';
import 'package:crypto_detect/presentation/di/di_client.dart';
import 'package:crypto_detect/presentation/di/di_repository.dart';
import 'package:crypto_detect/presentation/di/di_router.dart';
import 'package:crypto_detect/presentation/di/di_service.dart';
import 'package:crypto_detect/presentation/di/di_use_case.dart';
import 'package:crypto_detect/presentation/di/di_view_model.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

class DependencyInjection {
  static Future<void> setUp() async {
    await DiRepository.setUp(instance);
    DiClient.setUp(instance);
    DiRouter.setUp(instance);
    DiService.setUp(instance);
    DiUseCase.setUp(instance);
    DiViewModel.setUp(instance);
    DiAdapter.setUp(instance);
  }
}

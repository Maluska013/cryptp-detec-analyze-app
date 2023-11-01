import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:get_it/get_it.dart';

class DiRouter {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  }
}

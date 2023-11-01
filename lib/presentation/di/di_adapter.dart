import 'package:crypto_detect/adapters/permission_adapter.dart';
import 'package:get_it/get_it.dart';

class DiAdapter {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerSingleton<PermissionsAdapter>(PermissionsAdapterImpl());
  }
}

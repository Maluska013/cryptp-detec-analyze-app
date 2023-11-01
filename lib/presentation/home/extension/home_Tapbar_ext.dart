import 'package:crypto_detect/presentation/home/home_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

extension OfferStatusExt on HomeControlType {
  String text() {
    switch (this) {
      case HomeControlType.scan:
        return 'Escanear';
      case HomeControlType.history:
        return 'Mi lista';
    }
  }

  IconData icon() {
    return switch (this) {
      HomeControlType.scan => PhosphorIcons.camera(),
      HomeControlType.history => PhosphorIcons.listBullets(),
    };
  }
}

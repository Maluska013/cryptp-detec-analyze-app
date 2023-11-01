import 'package:auto_route/auto_route.dart';
import 'package:crypto_detect/presentation/entities/sample.dart';
import 'package:crypto_detect/presentation/history/sample_detail/sample_detail_sc.dart';
import 'package:crypto_detect/presentation/home/home_sc.dart';
import 'package:crypto_detect/presentation/image_scan/confirm_scan/confirm_scan_sc.dart';
import 'package:crypto_detect/presentation/image_scan/fail_analyze/faild_analyze_sc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SampleDetailRoute.page),
        AutoRoute(page: ConfirmScanRoute.page),
      ];
}

import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/presentation/di/di.dart';
import 'package:crypto_detect/presentation/route/app_router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

//  final _appRouter = AppRouter();
  final _appRouter = instance.get<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      routerConfig: _appRouter.config(),
    );
  }
}

class AppTheme {
  const AppTheme._();

  static get appTheme {
    final appTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.grayTheme.black),
    );
    return appTheme.copyWith(
      textTheme: appTheme.textTheme.apply(
        bodyColor: Palette.grayTheme.black,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Palette.grayTheme.white,
        unselectedLabelColor: Palette.grayTheme.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Palette.grayTheme.black,
          borderRadius: BorderRadius.circular(60),
        ),
        dividerColor: Colors.transparent,
        indicatorColor: Palette.grayTheme.black,
      ),
      dividerTheme: appTheme.dividerTheme.copyWith(
        color: Palette.grayTheme.gray700,
      ),
    );
  }
}

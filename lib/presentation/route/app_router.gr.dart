// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ConfirmScanRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmScanRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmScanScreen(
          key: args.key,
          image: args.image,
        ),
      );
    },
    FailAnalyzeRoute.name: (routeData) {
      final args = routeData.argsAs<FailAnalyzeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FailAnalyzeScreen(
          key: args.key,
          image: args.image,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          tabIndex: args.tabIndex,
        ),
      );
    },
    SampleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<SampleDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SampleDetailScreen(
          key: args.key,
          sample: args.sample,
        ),
      );
    },
  };
}

/// generated route for
/// [ConfirmScanScreen]
class ConfirmScanRoute extends PageRouteInfo<ConfirmScanRouteArgs> {
  ConfirmScanRoute({
    Key? key,
    required XFile image,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmScanRoute.name,
          args: ConfirmScanRouteArgs(
            key: key,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmScanRoute';

  static const PageInfo<ConfirmScanRouteArgs> page =
      PageInfo<ConfirmScanRouteArgs>(name);
}

class ConfirmScanRouteArgs {
  const ConfirmScanRouteArgs({
    this.key,
    required this.image,
  });

  final Key? key;

  final XFile image;

  @override
  String toString() {
    return 'ConfirmScanRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [FailAnalyzeScreen]
class FailAnalyzeRoute extends PageRouteInfo<FailAnalyzeRouteArgs> {
  FailAnalyzeRoute({
    Key? key,
    required XFile image,
    List<PageRouteInfo>? children,
  }) : super(
          FailAnalyzeRoute.name,
          args: FailAnalyzeRouteArgs(
            key: key,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'FailAnalyzeRoute';

  static const PageInfo<FailAnalyzeRouteArgs> page =
      PageInfo<FailAnalyzeRouteArgs>(name);
}

class FailAnalyzeRouteArgs {
  const FailAnalyzeRouteArgs({
    this.key,
    required this.image,
  });

  final Key? key;

  final XFile image;

  @override
  String toString() {
    return 'FailAnalyzeRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    int tabIndex = 0,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            tabIndex: tabIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.tabIndex = 0,
  });

  final Key? key;

  final int tabIndex;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, tabIndex: $tabIndex}';
  }
}

/// generated route for
/// [SampleDetailScreen]
class SampleDetailRoute extends PageRouteInfo<SampleDetailRouteArgs> {
  SampleDetailRoute({
    Key? key,
    required Sample sample,
    List<PageRouteInfo>? children,
  }) : super(
          SampleDetailRoute.name,
          args: SampleDetailRouteArgs(
            key: key,
            sample: sample,
          ),
          initialChildren: children,
        );

  static const String name = 'SampleDetailRoute';

  static const PageInfo<SampleDetailRouteArgs> page =
      PageInfo<SampleDetailRouteArgs>(name);
}

class SampleDetailRouteArgs {
  const SampleDetailRouteArgs({
    this.key,
    required this.sample,
  });

  final Key? key;

  final Sample sample;

  @override
  String toString() {
    return 'SampleDetailRouteArgs{key: $key, sample: $sample}';
  }
}

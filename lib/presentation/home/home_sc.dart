import 'package:auto_route/auto_route.dart';
import 'package:crypto_detect/presentation/history/history_samples_sc.dart';
import 'package:crypto_detect/presentation/home/home_vm.dart';
import 'package:crypto_detect/presentation/home/widgets/home_controller_tab_wd.dart';
import 'package:crypto_detect/presentation/image_scan/photo_sc.dart';
import 'package:crypto_detect/presentation/mvvm/view_state.abs.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  final int tabIndex;

  const HomeScreen({
    Key? key,
    this.tabIndex = 0,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ViewState<HomeScreen, HomeViewModel>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: HomeControlType.values.length, vsync: this)
          ..animateTo(widget.tabIndex);
    viewModel.init();
    _controller.addListener(() {
      viewModel.onFeaturePressed(_controller.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
      stream: viewModel.state,
      builder: (BuildContext context, AsyncSnapshot<HomeState> snapshot) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SafeArea(
              minimum: const EdgeInsets.only(
                top: 30.0,
                left: 16.0,
                right: 16.0,
              ),
              child: HomeTabBar(
                tabIndex: _controller.index,
                controller: _controller,
              ),
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: [
              const PhotoGalleryScreen(),
              HistorySamples(
                onAddSample: () {
                  _controller.animateTo(0);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

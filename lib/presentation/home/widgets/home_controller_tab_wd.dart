import 'package:crypto_detect/design/theme/colors.dart';
import 'package:crypto_detect/presentation/home/extension/home_Tapbar_ext.dart';
import 'package:crypto_detect/presentation/home/home_vm.dart';
import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  final TabController controller;
  final int tabIndex;

  const HomeTabBar({
    super.key,
    required this.controller,
    required this.tabIndex,
  });

  List<Widget> get _tabs {
    List<Widget> tabs = [];
    for (int i = 0; i < HomeControlType.values.length; i++) {
      final type = HomeControlType.values[i];
      tabs.add(
        _TapItem(
          label: tabIndex != i ? '' : type.text(),
          icon: type.icon(),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Palette.grayTheme.white,
        border: Border.all(
          color: Palette.grayTheme.gray700,
        ),
        borderRadius: BorderRadius.circular(60),
      ),
      child: TabBar(
        controller: controller,
        labelColor: Palette.grayTheme.white,
        unselectedLabelColor: Palette.grayTheme.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Palette.grayTheme.black,
          borderRadius: BorderRadius.circular(60),
        ),
        indicatorWeight: 0,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        padding: const EdgeInsets.all(8.0),
        splashBorderRadius: BorderRadius.circular(60),
        tabs: _tabs,
      ),
    );
  }
}

class _TapItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const _TapItem({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

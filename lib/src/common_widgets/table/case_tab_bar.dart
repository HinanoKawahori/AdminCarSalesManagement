import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/utils/style/color_style.dart';

class CaseTabBar extends HookConsumerWidget {
  const CaseTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  final List<Widget> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TabBar(
        controller: tabController,
        dividerColor: ColorStyle.secondGrey, // Remove any divider
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: ColorStyle.blue,
            width: 2,
          ),
          insets: EdgeInsets.symmetric(horizontal: 20.0), // Adjust as needed
        ),
        labelColor: ColorStyle.blue, // Active tab text color
        unselectedLabelColor: ColorStyle.mainGrey, // Inactive tab text color
        labelStyle: const TextStyle(
          fontSize: CustomFontSize.normal,
          fontWeight: FontWeight.bold, // Bold for active label
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: CustomFontSize.normal,
          fontWeight: FontWeight.normal,
        ),
        tabs: tabs,
      ),
    );
  }
}

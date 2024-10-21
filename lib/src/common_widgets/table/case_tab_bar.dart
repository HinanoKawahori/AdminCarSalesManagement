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
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: TabBar(
            controller: tabController,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                color: ColorStyle.blue,
                width: 3,
              ),
              insets: EdgeInsets.symmetric(horizontal: 20.0), // タブの横幅に合わせて調整
            ),
            labelColor: ColorStyle.blue, // アクティブタブのテキスト色
            labelStyle: const TextStyle(
              fontSize: CustomFontSize.normal,
              fontWeight: FontWeight.bold, // アクティブタブの太字
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: CustomFontSize.normal,
              fontWeight: FontWeight.normal,
            ),
            tabs: tabs,
          ),
        ),
        const Divider(
          color: ColorStyle.secondGrey, // Dividerの色
          // thickness: 2,
          height: 1,
        ),
      ],
    );
  }
}

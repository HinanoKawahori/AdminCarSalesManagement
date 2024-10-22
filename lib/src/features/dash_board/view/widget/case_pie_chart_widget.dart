import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CasePieChartWidget extends HookConsumerWidget {
  const CasePieChartWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO データをここから渡すようにする
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: ShowCaseCount(
                    title: '担当者未定',
                    count: '20',
                    colors: ColorStyle.backGroundColor,
                    iconData: Icon(
                      Icons.person,
                      color: ColorStyle.mainGrey,
                    ),
                  ),
                ),
                Container(
                  color: ColorStyle.secondGrey,
                  height: double.infinity,
                  width: 1,
                ),
                const Expanded(
                  flex: 1,
                  child: ShowCaseCount(
                    title: '日程調整中',
                    count: '20',
                    colors: ColorStyle.backGroundColor,
                    iconData: Icon(
                      Icons.schedule_send,
                      color: ColorStyle.mainGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: ColorStyle.secondGrey),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: ShowCaseCount(
                    title: '訪問日確定',
                    count: '20',
                    colors: ColorStyle.backGroundColor,
                    iconData: Icon(
                      Icons.calendar_month,
                      color: ColorStyle.mainGrey,
                    ),
                  ),
                ),
                Container(
                  color: ColorStyle.secondGrey,
                  height: double.infinity,
                  width: 1,
                ),
                const Expanded(
                  flex: 1,
                  child: ShowCaseCount(
                    iconData: Icon(
                      Icons.pending_actions,
                      color: ColorStyle.mainGrey,
                    ),
                    title: '検討待ち',
                    count: '20',
                    colors: ColorStyle.backGroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowCaseCount extends StatelessWidget {
  const ShowCaseCount({
    super.key,
    required this.title,
    required this.count,
    required this.colors,
    required this.iconData,
  });
  final String title;
  final String count;
  final List<Color> colors;
  final Icon iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            WidthMargin.normal,
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                gradient: LinearGradient(
                  colors: colors,
                ),
              ),
              child: iconData,
            ),
            WidthMargin.small,
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorStyle.mainGrey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              count,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorStyle.blue,
                fontSize: 50,
              ),
            ),
            const Text(
              '件',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorStyle.mainGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

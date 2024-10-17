import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/padding_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/utils/style/color_style.dart';
import '../../employee/view/component/employee_list_view.dart';

class DashBoardPage extends HookConsumerWidget {
  const DashBoardPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyle.paleBlue,
      body: Padding(
        padding: PaddingStyle.normal,
        child: Row(
          children: [
            Column(
              children: [
                //TODO
                DataCard(
                  titleText: '稼働中の案件数',
                  dataWidget: Container(),
                ),
                HeightMargin.normal,
                DataCard(
                  titleText: '稼働中の案件数',
                  dataWidget: Container(),
                ),
              ],
            ),
            WidthMargin.normal,
            Column(
              children: [
                //TODO
                DataCard(
                  titleText: '稼働中の案件数',
                  dataWidget: Container(),
                ),
                HeightMargin.normal,
                DataCard(
                  titleText: '稼働中の案件数',
                  dataWidget: Container(),
                ),
                HeightMargin.normal,
                DataCard(
                  titleText: '稼働中の案件数',
                  dataWidget: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  const DataCard({
    super.key,
    required this.titleText,
    required this.dataWidget,
  });

  final String titleText;
  final Widget dataWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: PaddingStyle.normal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titleText),
            dataWidget,
          ],
        ),
      ),
    );
  }
}

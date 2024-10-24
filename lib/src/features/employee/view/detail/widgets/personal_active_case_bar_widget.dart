import 'package:admin_car_sales_management/src/config/enum/sales_status.dart';
import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/component/indicator_with_number.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/component/progress_bar_painter.dart';
import 'package:admin_car_sales_management/src/function/switch_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersonalActiveCaseBarWidget extends ConsumerWidget {
  const PersonalActiveCaseBarWidget({
    super.key,
  });
  final int totalCases = 66;
  final int inProgress = 40;
  final int awaitingConfirmation = 10;
  final int awaitingPayment = 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '案件数  $totalCases件',
              style: const TextStyle(
                fontSize: CustomFontSize.largest,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HeightMargin.normal,
        CustomPaint(
          size: const Size(double.infinity, 24),
          painter: ActiveCaseProgressBarPainter(
            inProgress: inProgress,
            awaitingConfirmation: awaitingConfirmation,
            awaitingPayment: awaitingPayment,
            totalCases: totalCases,
          ),
        ),
        HeightMargin.medium,
        Row(
          children: [
            //日程調整中
            IndicatorWithNumber(
              color: ColorStyle.blue,
              label: getStatusText(CaseStatus.scheduling.value),
              count: 40,
            ),
            WidthMargin.normal,
            //訪問日確定
            IndicatorWithNumber(
              color: ColorStyle.lightBlue,
              label: getStatusText(CaseStatus.confirmedVisit.value),
              count: 20,
            ),
            WidthMargin.normal,
            //検討待ち
            IndicatorWithNumber(
              color: ColorStyle.lightBlue2,
              label: getStatusText(CaseStatus.pending.value),
              count: 20,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:admin_car_sales_management/src/config/utils/style/color_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/custom_font_style.dart';
import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/component/indicator_with_number.dart';
import 'package:admin_car_sales_management/src/features/employee/view/detail/component/progress_bar_painter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../config/enum/sales_status.dart';
import '../../../../../function/switch_data.dart';

class SuccessRateWidget extends ConsumerWidget {
  const SuccessRateWidget({
    super.key,
  });
  final int success = 40;
  final int lost = 73;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '平均成約率 ${(success / (success + lost) * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: CustomFontSize.largest,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HeightMargin.normal,
        SizedBox(
          // width: 800,
          child: CustomPaint(
            size: const Size(double.infinity, 24),
            painter: PastCaseProgressBarPainter(
              success: success,
              lost: lost,
            ),
          ),
        ),
        HeightMargin.normal,
        Row(
          children: [
            IndicatorWithNumber(
              color: ColorStyle.pink,
              label: getStatusText(CaseStatus.success.value),
              count: success,
            ),
            WidthMargin.normal,
            IndicatorWithNumber(
              color: ColorStyle.secondGrey,
              label: getStatusText(CaseStatus.lost.value),
              count: lost,
            ),
          ],
        ),
      ],
    );
  }
}

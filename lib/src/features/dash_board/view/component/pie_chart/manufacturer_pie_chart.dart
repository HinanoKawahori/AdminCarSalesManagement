import 'package:admin_car_sales_management/src/config/utils/style/height_margin.dart';
import 'package:admin_car_sales_management/src/config/utils/style/width_margin.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../config/utils/style/color_style.dart';
import 'indicator.dart';

class ManufacturerPieChart extends HookConsumerWidget {
  const ManufacturerPieChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final touchedIndex = useState(-1);

    List<PieChartSectionData> showingSections() {
      return List.generate(4, (i) {
        final isTouched = i == touchedIndex.value;
        final fontSize = isTouched ? 20.0 : 16.0;
        final radius = isTouched ? 48.0 : 42.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: ColorStyle.pieChartDarkBlue,
              value: 40,
              title: '40%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: ColorStyle.pieChartMediumBlue,
              value: 30,
              title: '30%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: ColorStyle.pieChartLightBlue,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          case 3:
            return PieChartSectionData(
              color: ColorStyle.pieChartPowderBlue,
              value: 15,
              title: '15%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorStyle.white,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //単位のタイトル//////////////////////////////////////////
          AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex.value = -1;
                      return;
                    }
                    touchedIndex.value =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections(),
              ),
            ),
          ),

          WidthMargin.large,

          //単位のタイトル//////////////////////////////////////////
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: ColorStyle.pieChartDarkBlue,
                text: 'トヨタ',
              ),
              HeightMargin.small,
              Indicator(
                color: ColorStyle.pieChartMediumBlue,
                text: '日産',
              ),
              HeightMargin.small,
              Indicator(
                color: ColorStyle.pieChartLightBlue,
                text: 'マツダ',
              ),
              HeightMargin.small,
              Indicator(
                color: ColorStyle.pieChartPowderBlue,
                text: 'ホンダ',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
